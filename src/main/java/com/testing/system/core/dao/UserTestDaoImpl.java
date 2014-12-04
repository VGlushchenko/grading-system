package com.testing.system.core.dao;

import com.testing.system.core.entity.UserTest;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.Query;
import java.util.List;

@Repository
public class UserTestDaoImpl implements UserTestDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public UserTest getById(Integer userTestId) {
        Query query = (Query) sessionFactory.getCurrentSession().get(UserTest.class, userTestId);
        return (UserTest) query.uniqueResult();
    }

    @Override
    public List<UserTest> list(Integer userId) {
        Query query = sessionFactory.getCurrentSession().createQuery("from UserTest as ut fetch all properties where ut.userId = :userId")
                .setInteger("userId", userId);
        return query.list();
    }

    @Override
    public void save(UserTest userTest) {
        sessionFactory.getCurrentSession().saveOrUpdate(userTest);
    }

    @Override
    public void flush() {
        sessionFactory.getCurrentSession().flush();
    }

    @Override
    public void clear() {
        sessionFactory.getCurrentSession().clear();
    }

    @Override
    public void merge(UserTest userTest) {
        sessionFactory.getCurrentSession().merge(userTest);
    }
}
