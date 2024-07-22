package com.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentBean {
    Integer paymentId;
    Integer userId;
    String authcode;
    String trasactionid;
    Date date;
    String cardnumber;
    String expiryDate;
    Double totalamount;
}

