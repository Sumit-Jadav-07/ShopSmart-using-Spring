package com.controller;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.CameraBean;
import com.dao.CameraDao;

@Controller
public class CameraController {

  @Autowired
  CameraDao dao;

  @GetMapping("/addcamerapage")
  public String addCameraPage(CameraBean bean) {
    return "AddCamera";
  }

  @PostMapping("/addcamera")
  public String addCamera(CameraBean bean) {
    if (bean.getCameraImagePath() == null) {
      String cameraImagePath = "D:\\Royal\\Spring\\EcommerceApp\\src\\main\\webapp\\images\\products\\camera";

      try{
        File file = new File(cameraImagePath, bean.getCameraImage().getOriginalFilename());
        byte b[] = bean.getCameraImage().getBytes();
        FileUtils.writeByteArrayToFile(file, b);
        bean.setCameraImagePath("images/products/camera/" + bean.getCameraImage().getOriginalFilename());
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      return "";
    }
    dao.addCamera(bean);
    return "redirect:/addcamerapage";
  }
}
