package com.testing.system.core.dao;

import com.testing.system.core.entity.Answer;

import java.util.List;

public interface AnswerDao {

    List<Answer> getByIds(List<Integer> ids);

    void clear();
}
