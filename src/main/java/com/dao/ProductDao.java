package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ProductBean;

@Repository
public class ProductDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	public void addProduct(ProductBean pBean) {
		stmt.update("INSERT INTO productsdetails (product_name, category, price, quantity, product_image_path) VALUES (?, ?, ?, ?, ?)" , pBean.getProductName() , pBean.getCategory() , pBean.getPrice() , pBean.getQuantity() , pBean.getProductImagePath());
	}
    
}