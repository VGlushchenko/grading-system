package com.testing.system.core.service;

import com.testing.system.core.entity.Test;
import com.testing.system.core.entity.UserTest;
import com.testing.system.core.entity.UserTestAnswer;

import java.util.List;

public interface TestService {

    List<Test> getTests();

    List<UserTest> getUserTests();

    Integer checkScore(Integer testId, List<Integer> ids);
}
