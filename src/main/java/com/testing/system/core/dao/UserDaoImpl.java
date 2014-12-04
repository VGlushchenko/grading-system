package com.testing.system.core.dao;

import com.testing.system.core.entity.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User getById(Integer id) {
        Query query = (Query) sessionFactory.getCurrentSession().get(User.class, id);
        return (User) query.uniqueResult();
    }

    @Override
    public User findByEmail(String email) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from users where email like :email")
                .addEntity(User.class);
        query.setString("email", email);
        return (User) query.uniqueResult();
    }

    @Override
    public void create(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }
}
