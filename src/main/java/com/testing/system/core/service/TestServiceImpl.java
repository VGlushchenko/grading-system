package com.testing.system.core.service;

import com.testing.system.core.dao.AnswerDao;
import com.testing.system.core.dao.TestDao;
import com.testing.system.core.dao.UserTestAnswerDao;
import com.testing.system.core.dao.UserTestDao;
import com.testing.system.core.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
@Transactional
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

    @Autowired
    private UserTestDao userTestDao;

    @Autowired
    private AnswerDao answerDao;

    @Autowired
    private UserTestAnswerDao userTestAnswerDao;

    @Override
    public List<Test> getTests() {
        return testDao.list();
    }

    @Override
    public List<UserTest> getUserTests() {
        SecurityUser user = (SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return userTestDao.list(user.getId());
    }

    @Override
    public Integer checkScore(Integer testId, List<Integer> ids) {
        List<Answer> answers = answerDao.getByIds(ids);
        UserTest userTest = saveUserTest(testId, answers);

        Set<UserTestAnswer> userTestAnswers = new HashSet<>();
        processForUserTestAnswers(answers, userTestAnswers, userTest.getId());

        userTestAnswerDao.save(userTestAnswers);

        return userTest.getScore();
    }

    private int getAmountOfRightAnswers(List<Answer> answers) {
        int result = 0;

        for(Answer answer : answers) {
            if(answer.getIsRightAnswer())
                result++;
        }

        return result;
    }

    private void processForUserTestAnswers(List<Answer> answers, Set<UserTestAnswer> userTestAnswers, Integer userTestId) {

        UserTestAnswer userTestAnswer;
        Question question;

        for(Answer answer : answers) {
            userTestAnswer = new UserTestAnswer();
            userTestAnswer.setAnswer(answer);
            userTestAnswer.setQuestionId(answer.getQuestionId());
            userTestAnswer.setUserTestId(userTestId);
            userTestAnswers.add(userTestAnswer);
        }
    }

    private UserTest saveUserTest(Integer testId, List<Answer> answers) {
        Test test = testDao.getById(testId);
        SecurityUser user = (SecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserTest userTest = new UserTest();

        userTest.setTest(test);
        userTest.setUserId(user.getId());
        userTest.setScore(getAmountOfRightAnswers(answers));
        userTest.setPassedAt(new Date());

        userTestDao.save(userTest);

        return userTest;
    }
}
