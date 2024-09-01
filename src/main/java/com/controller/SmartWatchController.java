package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.SmartWatchBean;
import com.dao.SmartWatchDao;


@Controller
public class SmartWatchController {

  @Autowired
  SmartWatchDao dao;

  @GetMapping("/addsmartwatchpage")
  public String AddSmartWatchPage() {
    return "AddSmartwatch";
  }

  @PostMapping("addsmartwatch")
  public String AddSmartWatch(SmartWatchBean bean) {

    if(bean.getSmartWatchImagePath() == null) {
      String smartWatchPath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\smartwatch";

      try{
        File smartWatchFile = new File(smartWatchPath, bean.getSmartWatchImage().getOriginalFilename());
        byte b[] = bean.getSmartWatchImage().getBytes(); // Copy image into bytes
        FileUtils.writeByteArrayToFile(smartWatchFile, b); // Copy bytes into image

        bean.setSmartWatchImagePath("images/products/smartwatch/"+ bean.getSmartWatchImage().getOriginalFilename());

      } catch(Exception e){
        e.printStackTrace();
      }
    } else {
      return "";
    }
    dao.addSmartWatch(bean);
    return "redirect:/addsmartwatchpage";
  }
}
