package com.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Component
public class ProductBean {
    
	Integer id;
	String productName;
    String category;
    Float price;
    Integer quantity;
    MultipartFile productImage;
    String productImagePath;
    
}
