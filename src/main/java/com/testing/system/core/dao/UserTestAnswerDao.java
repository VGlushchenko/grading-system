package com.testing.system.core.dao;

import com.testing.system.core.entity.UserTest;
import com.testing.system.core.entity.UserTestAnswer;

import java.util.List;
import java.util.Set;

public interface UserTestAnswerDao {

    void save(Set<UserTestAnswer> userTestAnswers);

    void save(UserTestAnswer userTestAnswer);
}
