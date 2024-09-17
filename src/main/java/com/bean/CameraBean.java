package com.bean;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
public class CameraBean implements Product {

  Integer cameraId;
  String name;
  String brand;
  Integer resolution;  
  Integer zoom;        
  String lensType;     
  Integer battery;     
  Integer quantity;
  Float price;
  MultipartFile cameraImage;  
  String cameraImagePath; 
  
  @Override
  public Integer getId() {
    return cameraId;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public String getImagePath() {
    return cameraImagePath;
  }

  @Override
  public Float getPrice() {
    return price;
  }
  
}
