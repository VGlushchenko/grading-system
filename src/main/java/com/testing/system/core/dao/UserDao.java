package com.testing.system.core.dao;

import com.testing.system.core.entity.User;
import org.springframework.stereotype.Repository;

public interface UserDao {

    User getById(Integer id);

    User findByEmail(String email);

    void create(User user);

    void update(User user);
}