package com.testing.system.core.dao;

import com.testing.system.core.entity.Answer;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.Query;
import java.util.List;

@Repository
public class AnswerDaoImpl implements AnswerDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Answer> getByIds(List<Integer> ids) {
        Query query = sessionFactory.getCurrentSession().createQuery("from Answer where id in (:ids)")
                .setParameterList("ids", ids);
        return query.list();
    }

    @Override
    public void clear() {
        sessionFactory.getCurrentSession().clear();
    }
}
