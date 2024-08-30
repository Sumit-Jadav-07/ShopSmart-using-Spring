package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.LaptopBean;

@Repository
public class LaptopDao {

  @Autowired
  JdbcTemplate stmt;

  public void addLaptop(LaptopBean bean){
    String sql = "INSERT INTO laptops (name, brand, ram, storage, processor, price, quantity, laptopImagePath) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    stmt.update(sql, bean.getName(), bean.getBrand(), bean.getRam(), bean.getStorage(), bean.getProcessor(), bean.getPrice(), bean.getQuantity(), bean.getLaptopImagePath());

  }
  
}
