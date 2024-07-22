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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Cookie;

@Controller
public class CartController {

    @Autowired
    CartDao cDao;

    @GetMapping("/addtocart")
    public String addToCart(@RequestParam("productId") Integer productId, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String userIdStr = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    userIdStr = cookie.getValue();
                    break;
                }
            }
        }

        if (userIdStr == null) {
            // Handle the case when the cookie is not found
            return "redirect:/login"; // or any appropriate error page
        }
        Integer userId = Integer.parseInt(userIdStr);
        CartBean cBean = new CartBean();
        cBean.setProductId(productId);
        cBean.setUserId(userId);

        Integer quantity = cDao.checkExistingProduct(cBean);

        if(quantity == 0){
           cDao.addToCart(cBean);
        } else {
            cBean.setQuantity(quantity + 1);
            cDao.updateQuantity(cBean);
        }
        return "redirect:/customerdashboard";
    }

    @GetMapping("/mycartpage")
    public String myCart(HttpServletRequest request, Model model) {
        // Get the user ID from the cookie
        Cookie[] cookies = request.getCookies();
        String userIdStr = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    userIdStr = cookie.getValue();
                    break;
                }
            }
        }

        if (userIdStr == null) {
            // Handle the case when the cookie is not found
            return "redirect:/login"; // or any appropriate error page
        }

        Integer userId = Integer.parseInt(userIdStr);
        System.out.println(userId);

        List<ProductBean> products = cDao.myCart(userId);
        model.addAttribute("products", products);

        return "MyCart";
    }

    @GetMapping("/removecartitem")
    public String removerCartItem(@RequestParam("productId") Integer productId) {
        cDao.deleteCartItem(productId);
        return "redirect:/mycartpage";
    }

}
