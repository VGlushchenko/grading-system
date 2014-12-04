package com.testing.system.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
    public String welcomePage() {
        return "redirect:/scores";
    }

    @RequestMapping(value = "/scores", method = RequestMethod.GET)
    public String homePage() {
        return "index" ;
    }
}