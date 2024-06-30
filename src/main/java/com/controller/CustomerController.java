package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {

    @GetMapping("/customerdashboard")
    public String customerDashboard() {
        return "CustomerDashboard";
    }

}
