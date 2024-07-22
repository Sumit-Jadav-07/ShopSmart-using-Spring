package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.ProductBean;
import com.dao.ProductDao;

@Controller
public class CustomerController {

    @Autowired
    ProductDao pDao;

    @GetMapping("/customerdashboard")
    public String customerDashboard(Model model) {
        List<ProductBean> products = pDao.getAllProducts();
        model.addAttribute("products", products);
        return "CustomerDashboard";
    }
    
}
