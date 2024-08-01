package com.bean;

import lombok.Data;

@Data
public class PaymentBean {
    Integer paymentId;
    Integer userId;
    String authcode;
    String trasactionid;
    String cardnumber;
    String expiryDate;
    Double totalamount;
}

