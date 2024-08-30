package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.LaptopBean;
import com.dao.LaptopDao;


@Controller
public class LaptopController {

  @Autowired
  LaptopDao dao;

  @GetMapping("/addlaptoppage")
  public String addLaptopPage() {
      return "AddLaptop";
  }

  @PostMapping("addLaptop")
  public String postMethodName(LaptopBean bean) {
      
    if(bean.getLaptopImagePath() == null) {
      String laptopImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\laptops";
      try{
        File file = new File(laptopImagePath, bean.getLaptopImage().getOriginalFilename());
        byte b[] = bean.getLaptopImage().getBytes(); // Copy image into bytes
        FileUtils.writeByteArrayToFile(file, b); // Copy bytes into image

        bean.setLaptopImagePath("images/products/laptops/"+ bean.getLaptopImage().getOriginalFilename());

      } catch(Exception e) {
        e.printStackTrace();
      }
    }
    dao.addLaptop(bean);

    return "";
  }
  
  
  
}
