package com.bean;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = lombok.AccessLevel.PRIVATE)
public class CameraBean {

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
  
}
