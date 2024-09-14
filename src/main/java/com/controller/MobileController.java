package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.MobileBean;
import com.dao.MobileDao;

@Controller
public class MobileController {

  @Autowired
  MobileDao dao;

  @GetMapping("/addmobilepage")
  public String addMobilePage() {
    return "AddMobile";
  }

  @PostMapping("/addMobile")
  public String postMethodName(MobileBean bean) {

      if (bean.getMobileImagePath() == null) {
          String mobileImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\mobiles";
          try {
              File file = new File(mobileImagePath , bean.getMobileImage().getOriginalFilename());
              byte b[] = bean.getMobileImage().getBytes(); // Copy image into bytes
              FileUtils.writeByteArrayToFile(file, b); // Copy bytes into image

              bean.setMobileImagePath("images/products/mobiles/" + bean.getMobileImage().getOriginalFilename());
          } catch (Exception e) {
              e.printStackTrace();
          }

          dao.addMobile(bean);
        }

      return "redirect:/addmobilepage";
  }


}
