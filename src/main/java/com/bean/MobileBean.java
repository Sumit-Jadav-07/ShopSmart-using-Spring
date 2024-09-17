package com.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
@Component
public class MobileBean{

  Integer mobileId;
  String name;
  String brand;
  Integer ram;
  Integer storage;
  Integer battery;
  Integer camera;
  Float price;
  Integer quantity;
  MultipartFile mobileImage;
  String mobileImagePath;

}
