package com.dshabu.vapor.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {
    @GetMapping("")
    public String index() {
        return "index";
    }

    @GetMapping("/credits")
    public String credits() {
        return "credits";
    }
}
