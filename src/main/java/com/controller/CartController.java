package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.EcommerceAppBean;

import jakarta.servlet.http.HttpSession;


@Controller
public class CartController {

    @GetMapping("/addtocart")
    public String addToCart(@RequestParam("id") Integer pId , HttpSession session){
        EcommerceAppBean bean = (EcommerceAppBean)session.getAttribute("user");

        System.out.println(bean.getId());
        System.out.println(pId);

        return "redirect:/customerlistproducts";
    }
        
}
