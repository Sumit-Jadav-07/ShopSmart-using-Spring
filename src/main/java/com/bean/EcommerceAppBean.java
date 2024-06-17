package com.bean;

import lombok.Data;

@Data
public class EcommerceAppBean {
    
    Integer id;
    String fullname;
    String email;
    String password;
    String confirmpassword;
    String gender;
    String role;

    String newpass;
    String confirmnewpass;
    
}
