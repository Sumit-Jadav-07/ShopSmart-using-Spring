package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.EcommerceAppBean;

@Repository
public class UserDao {

    @Autowired
    JdbcTemplate stmt;

    public void insertUser(EcommerceAppBean ecom) {
        ecom.setRole("Customer");
        String sql = "INSERT INTO EcommerceApp (fullname, email, password, gender, role) VALUES (?, ?, ?, ?, ?)";
        try {
            int rowsAffected = stmt.update(sql, ecom.getFullname(), ecom.getEmail(), ecom.getPassword(), ecom.getGender(), ecom.getRole());
            if (rowsAffected > 0) {
                System.out.println("User inserted successfully");
            } else {
                System.err.println("No rows affected. Insert failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error inserting user: " + e.getMessage());
        }
    }

    public EcommerceAppBean getUserByEmail(String email) {
        try{
            EcommerceAppBean ecom = stmt.queryForObject("select * from EcommerceApp where email = ?",
                new BeanPropertyRowMapper<>(EcommerceAppBean.class), new Object[] { email });
            return ecom;
        } catch (Exception e){
            return null;
        }  
    }

    public void updatePassword(EcommerceAppBean ecom){
        String sql = "UPDATE ecommerceapp SET password = ? WHERE email = ?";
        try {
            int rowsAffected = stmt.update(sql, ecom.getPassword() , ecom.getEmail());
            if (rowsAffected > 0) {
                System.out.println("Password updated successfully");
            } else {
                System.err.println("No rows affected. Updation failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error updating password: " + e.getMessage());
        }
    }

}
