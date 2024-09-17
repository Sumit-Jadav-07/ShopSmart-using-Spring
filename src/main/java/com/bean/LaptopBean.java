package com.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
@Component
public class LaptopBean {

  Integer laptopId;
  String name;
  String brand;
  Integer ram;
  Integer storage;
  String processor;
  Float price;
  Integer quantity;
  MultipartFile laptopImage;
  String laptopImagePath;
  
}
