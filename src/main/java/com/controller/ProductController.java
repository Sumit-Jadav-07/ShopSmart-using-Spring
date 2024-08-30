package com.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        if (pBean.getProductImage() == null) {
            String productImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\";
            try {
                File file = new File(productImagePath, pBean.getProductImage().getOriginalFilename());
                byte b[] = pBean.getProductImage().getBytes(); // Copy image into bytes
                FileUtils.writeByteArrayToFile(file, b); // Copy bytes into image

                pBean.setProductImagePath("images/products/" + pBean.getProductImage().getOriginalFilename());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        pDao.addProduct(pBean);
        return "redirect:/listproductspage";
    }

    @GetMapping("/listproductspage")
    public String listProductsPage(Model model) {
        List<ProductBean> products = pDao.getAllProducts();
        model.addAttribute("products", products);
        return "ListProducts";
    }

    @GetMapping("/deleteproduct")
    public String deleteProduct(@RequestParam("productId") Integer id) {
        pDao.deleteProduct(id);
        return "redirect:/listproductspage";
    }

    @GetMapping("/viewproduct")
    public String viewProduct(@RequestParam("productId") Integer id, Model model) {
        ProductBean product = pDao.getProductId(id);
        model.addAttribute("product", product);
        return "ViewProduct";
    }

    @GetMapping("/editproductpage")
    public String editProductPage(@RequestParam("productId") Integer id, Model model) {
        ProductBean product = pDao.getProductId(id);
        model.addAttribute("product", product);
        return "EditProduct";
    }

    @PostMapping("/editproduct")
    public String editProduct(@RequestParam("productId") Integer id, ProductBean pBean) {

        ProductBean existingProduct = pDao.getProductId(id);

        if(pBean.getProductImage() != null && !pBean.getProductImage().isEmpty()){
            // Delete the existing image file if exists
            String existingImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\" + existingProduct.getProductImagePath();
            File existingFile = new File(existingImagePath);
            if(existingFile.exists()){
                existingFile.delete();
            }

            // Save the new image file
            String productImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\";
            try{
                File newFile = new File(productImagePath , pBean.getProductImage().getOriginalFilename());
                byte[] nb = pBean.getProductImage().getBytes();
                FileUtils.writeByteArrayToFile(newFile, nb);

                pBean.setProductImagePath("images/products/" + pBean.getProductImage().getOriginalFilename());
            } catch(Exception e){
                e.printStackTrace();
            }
        } else {
            // If no new image is provided, keep the existing image path
            pBean.setProductImagePath(existingProduct.getProductImagePath());
        }
        
        pDao.editProduct(pBean);
        
        return "redirect:/listproductspage";
    }
}
