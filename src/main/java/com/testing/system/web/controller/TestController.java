package com.testing.system.web.controller;

import com.testing.system.core.entity.Test;
import com.testing.system.core.entity.UserTest;
import com.testing.system.core.entity.UserTestAnswer;
import com.testing.system.core.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @ResponseBody
    @RequestMapping(value = "/tests", method = RequestMethod.GET)
    public List<Test> getTests() {
        return testService.getTests();
    }

    @ResponseBody
    @RequestMapping(value = "/user/tests", method = RequestMethod.GET)
    public List<UserTest> getUserTests() {
        return testService.getUserTests();
    }

    @ResponseBody
    @RequestMapping(value = "/tests/{testId}/answers", method = RequestMethod.POST)
    public Integer checkAnswers(@RequestBody List<Integer> ids, @PathVariable Integer testId) {
        return testService.checkScore(testId, ids);
    }
}
