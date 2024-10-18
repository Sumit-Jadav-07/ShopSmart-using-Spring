package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.CartBean;
import com.bean.ProductBean;
import com.dao.CartDao;
import com.service.Services;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CartController {

    @Autowired
    CartDao cDao;

    @Autowired
    HttpServletRequest request;

    @Autowired
    Services service;

    @GetMapping("/addtocart")
    public String addToCart(@RequestParam("productId") Integer productId, @RequestParam("type") String type) {
        if (service.getUserId() == null) {
            return "redirect:/loginpage";
        }
        Integer userId = Integer.parseInt(service.getUserId());
        CartBean cBean = new CartBean();
        cBean.setProductId(productId);
        cBean.setType(type);
        cBean.setUserId(userId);
        Integer quantity = cDao.checkExistingProduct(productId, userId, type);
        if (quantity == 0) {
            cDao.addToCart(cBean);
        } else {
            cBean.setQuantity(quantity + 1);
            cDao.updateQuantity(productId, userId, type, cBean.getQuantity());
        }
        return "redirect:/customerdashboard";
    }

    @GetMapping("/mycartpage")
    public String myCart(Model model) {
        Integer userId = Integer.parseInt(service.getUserId());
        List<ProductBean> products = cDao.getAllCartItemsForUser(userId);
        model.addAttribute("products", products);
        return "MyCart";
    }

    @GetMapping("/removecartitem")
    public String removerCartItem(@RequestParam("productId") Integer productId, @RequestParam("type") String type) {
        Integer userId = Integer.parseInt(service.getUserId());
        cDao.deleteCartItem(productId, type, userId);
        return "redirect:/mycartpage";
    }

    @GetMapping("/decreasequantity")
    public String decreaseQuantity(@RequestParam("productId") Integer productId, @RequestParam("type") String type,
            HttpServletRequest request) {
        Integer userId = Integer.parseInt(service.getUserId());
        CartBean cBean = new CartBean();
        cBean.setProductId(productId);
        Integer quantity = cDao.checkExistingProduct(productId, userId, type);

        if (quantity > 1) {
            cBean.setQuantity(quantity - 1);
            cDao.updateQuantity(productId, userId, type, cBean.getQuantity());
        } else {
            cDao.deleteCartItem(productId, type, userId);
        }
        return "redirect:/mycartpage";
    }

    @GetMapping("/increasequantity")
    public String increaseQuantity(@RequestParam("productId") Integer productId, @RequestParam("type") String type,
            HttpServletRequest request) {
        Integer userId = Integer.parseInt(service.getUserId());
        CartBean cBean = new CartBean();

        cBean.setProductId(productId);
        Integer quantity = cDao.checkExistingProduct(productId, userId, type);
        cBean.setQuantity(quantity + 1);
        cDao.updateQuantity(productId, userId, type, cBean.getQuantity());
        return "redirect:/mycartpage";
    }

}
