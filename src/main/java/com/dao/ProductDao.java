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
		stmt.update("delete from productsdetails where productId = ?", id);
	}
    
	public ProductBean getProductId(Integer id){
		ProductBean bean = stmt.queryForObject("select * from productsdetails where productId = ?", new BeanPropertyRowMapper<>(ProductBean.class), new Object[]{id});
		return bean;
	}
	public void editProduct(ProductBean product) {
		// Retrieve the existing product details
		String exProduct = "SELECT * FROM productsdetails WHERE productId = ?";
		ProductBean existingProduct = stmt.queryForObject(exProduct, new BeanPropertyRowMapper<>(ProductBean.class), product.getProductId());
	
		// Debug statements
		System.out.println("Existing Product Name: " + existingProduct.getProductName());
		System.out.println("Existing Product Category: " + existingProduct.getCategory());
	
		if (product.getProductName() == null) {
			product.setProductName(existingProduct.getProductName());
		}
		if (product.getCategory() == null) {
			product.setCategory(existingProduct.getCategory());
		}
		if (product.getPrice() == null) {
			product.setPrice(existingProduct.getPrice());
		}
		if (product.getQuantity() == null) {
			product.setQuantity(existingProduct.getQuantity());
		}
	
		// Debug statements
		System.out.println("Updated Product Name: " + product.getProductName());
		System.out.println("Updated Product Category: " + product.getCategory());
	
		String sql = "UPDATE productsdetails SET product_name = ?, category = ?, price = ?, quantity = ?, product_image_path = ? WHERE productId = ?";
	
		try {
			stmt.update(sql, product.getProductName(), product.getCategory(), product.getPrice(), product.getQuantity(), product.getProductImagePath(), product.getProductId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}