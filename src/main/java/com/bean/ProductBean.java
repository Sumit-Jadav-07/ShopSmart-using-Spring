package com.bean;

import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
public class ProductBean {
    
	Integer productId;
	String productName;
    Float price;
    Integer quantity;
    String type;
    String productImagePath;
    
}
