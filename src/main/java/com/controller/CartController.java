package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.CartBean;
import com.bean.EcommerceAppBean;
import com.dao.CartDao;

import jakarta.servlet.http.HttpSession;


@Controller
public class CartController {

    @Autowired
    CartDao cDao;
        
    @GetMapping("/addtocart")
    public String addToCart(@RequestParam("id") Integer productId , HttpSession session){
        EcommerceAppBean bean = (EcommerceAppBean) session.getAttribute("user");
        Integer userId = bean.getId();
        CartBean cBean = new CartBean();
        cBean.setProductId(productId);
        cBean.setUserId(userId);
        cDao.addToCart(cBean);
        return "redirect:/customerlistproducts";
    }
        
}
