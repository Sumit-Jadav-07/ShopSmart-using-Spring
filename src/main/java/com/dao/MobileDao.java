package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.MobileBean;

@Repository
public class MobileDao {

  @Autowired
  JdbcTemplate stmt;

  public void addMobile(MobileBean bean) {
    String sql = "INSERT INTO mobiles (name, brand, ram, storage, battery, camera, price, quantity, imagepath) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    stmt.update(sql, bean.getName(), bean.getBrand(), bean.getRam(), bean.getStorage(), bean.getBattery(),
        bean.getCamera(), bean.getPrice(), bean.getQuantity(), bean.getMobileImagePath());
  }

  public List<MobileBean> getAllMobiles(){
		List<MobileBean> mobiles = stmt.query("select * from mobiles", new BeanPropertyRowMapper<MobileBean>(MobileBean.class));
		return mobiles;
	}

}
