package com.testing.system.core.dao;

import com.testing.system.core.entity.Test;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestDaoImpl implements TestDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Test getById(Integer id) {
        return (Test) sessionFactory.getCurrentSession().get(Test.class, id);
    }

    @Override
    public List<Test> list() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Test order by createdAt asc");
        return query.list();
    }
}
