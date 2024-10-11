package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.ProductBean;
import com.dao.CartDao;
import com.dao.ProductDao;

@Controller
public class CustomerController {

    @Autowired
    ProductDao pDao;

    @Autowired
    CartDao cDao;

    @GetMapping("/customerdashboard")
    public String customerDashboard(Model model) {
        List<ProductBean> products = cDao.getAllProducts();
        model.addAttribute("products", products);
        return "CustomerDashboard";
    }
    
}
