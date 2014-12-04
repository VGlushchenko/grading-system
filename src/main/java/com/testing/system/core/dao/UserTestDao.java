package com.testing.system.core.dao;

import com.testing.system.core.entity.UserTest;

import java.util.List;

public interface UserTestDao {

    UserTest getById(Integer userTestId);

    List<UserTest> list(Integer userId);

    void save(UserTest userTest);

    void flush();

    void clear();

    void merge(UserTest userTest);
}
