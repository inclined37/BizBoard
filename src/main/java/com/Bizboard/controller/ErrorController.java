package com.Bizboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/error/errorPage")
    public String accessDenied() {
        return "error/errorPage";
    }

}