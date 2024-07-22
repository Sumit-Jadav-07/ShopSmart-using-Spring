package com.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Component
public class ProductBean {
    
	Integer productId;
	String productName;
    String category;
    Float price;
    Integer quantity;
    MultipartFile productImage;
    String productImagePath;
    
}
