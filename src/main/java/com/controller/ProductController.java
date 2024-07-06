package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.ProductBean;
import com.dao.ProductDao;

@Controller
public class ProductController {

    @Autowired
    ProductDao pDao;

    @GetMapping("addproductpage")
    public String addProductPage() {
        return "AddProduct";
    }

    @PostMapping("addProduct")
    public String addProduct(ProductBean pBean) {

        String productImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\";
        try {
            File file = new File(productImagePath, pBean.getProductImage().getOriginalFilename());
            byte b[] = pBean.getProductImage().getBytes(); // Copy image into bytes
            FileUtils.writeByteArrayToFile(file, b); // Copy bytes into image

            pBean.setProductImagePath("images/products/" + pBean.getProductImage().getOriginalFilename());
            pDao.addProduct(pBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/listproductspage";
    }

    @GetMapping("/listproductspage")
    public String listProductsPage() {
        return "ListProduct";
    }

}
