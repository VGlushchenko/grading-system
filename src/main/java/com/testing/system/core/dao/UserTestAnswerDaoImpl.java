package com.testing.system.core.dao;

import com.testing.system.core.entity.UserTestAnswer;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public class UserTestAnswerDaoImpl implements UserTestAnswerDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Set<UserTestAnswer> userTestAnswers) {
        for(UserTestAnswer answer : userTestAnswers) {
            sessionFactory.getCurrentSession().save(answer);
        }
    }

    @Override
    public void save(UserTestAnswer userTestAnswer) {
        sessionFactory.getCurrentSession().saveOrUpdate(userTestAnswer);
    }
}
