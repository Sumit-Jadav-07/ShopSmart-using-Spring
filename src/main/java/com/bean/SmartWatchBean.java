package com.bean;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
public class SmartWatchBean implements Product {

  Integer smartWatchId;
  String name;
  String brand;
  Integer battery;
  String features;
  String display;
  Integer quantity;
  Float price;
  MultipartFile smartWatchImage;
  String smartWatchImagePath;

  @Override
  public Integer getId() {
    return smartWatchId;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public String getImagePath() {
    return smartWatchImagePath;
  }

  @Override
  public Float getPrice() {
    return price;
  }
  
}
