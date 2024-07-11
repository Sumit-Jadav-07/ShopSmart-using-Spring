package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.ProductDao;
import com.bean.ProductBean;

@Controller
public class CustomerProductController {

    @Autowired
    ProductDao pDao;

    @GetMapping("/customerlistproducts")
    public String customerListProducts(Model model) {
        List<ProductBean> products = pDao.getAllProducts();
        model.addAttribute("products", products);
        return "CustomerListProduct";
    }

}
