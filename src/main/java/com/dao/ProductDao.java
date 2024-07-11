package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.bean.ProductBean;

@Repository
public class ProductDao {
	
	@Autowired
	JdbcTemplate stmt;
	
	public void addProduct(ProductBean pBean) {
		stmt.update("INSERT INTO productsdetails (product_name, category, price, quantity, product_image_path) VALUES (?, ?, ?, ?, ?)" , pBean.getProductName() , pBean.getCategory() , pBean.getPrice() , pBean.getQuantity() , pBean.getProductImagePath());
	}

	public List<ProductBean> getAllProducts(){
		List<ProductBean> productsList = stmt.query("select * from productsdetails", new BeanPropertyRowMapper<ProductBean>(ProductBean.class));
		return productsList;
	}

	public void deleteProduct(Integer id){
		stmt.update("delete from productsdetails where id = ?", id);
	}
    
	public ProductBean getProductId(Integer productId){
		ProductBean bean = stmt.queryForObject("select * from productsdetails where id = ?", new BeanPropertyRowMapper<>(ProductBean.class), new Object[]{productId});
		return bean;
	}

}