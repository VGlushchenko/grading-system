package com.testing.system.core.dao;

import com.testing.system.core.entity.Test;

import java.util.List;

public interface TestDao {

    Test getById(Integer id);

    List<Test> list();
}
