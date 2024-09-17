package com.bean;

import lombok.Data;

@Data
public class CartBean {
    Integer cartId;
    Integer userId;
    Integer productId;
    Integer quantity;
    String type;  
}
