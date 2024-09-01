package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CameraBean;

@Repository
public class CameraDao {

  @Autowired
  JdbcTemplate stmt;

  public void addCamera(CameraBean bean) {
    String sql = "INSERT INTO cameras (name, brand, resolution, zoom, lens_type, battery, quantity, price, camera_image_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    stmt.update(sql, bean.getName(), bean.getBrand(), bean.getResolution(), bean.getZoom(), bean.getLensType(), bean.getBattery(), bean.getQuantity(), bean.getPrice(), bean.getCameraImagePath());
  }

}
