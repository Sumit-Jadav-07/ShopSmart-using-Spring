package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CartBean;

@Repository
public class CartDao {
    
    @Autowired
    JdbcTemplate stmt;

    public void addToCart(CartBean cBean){
        stmt.update("insert into carts (userId , productId) values (?,?)", cBean.getUserId(), cBean.getProductId());
    }

}
