package com.testing.system.core.service;

import com.testing.system.core.dao.TestDao;
import com.testing.system.core.dao.UserDao;
import com.testing.system.core.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private TestDao testDao;

    @Override
    public User findUserById(Integer id) {
        return userDao.getById(id);
    }

    @Override
    public User findUserByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public User createUser(User user) {
        userDao.create(user);
        return user;
    }

    @Override
    public User updateUser(User user) {
        userDao.update(user);
        return user;
    }
}
