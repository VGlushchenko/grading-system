package com.testing.system.core.service;

import com.testing.system.core.entity.User;

public interface UserService {

    User findUserByEmail(String email);

    User findUserById(Integer id);

    User createUser(User user);

    User updateUser(User user);
}
