package com.service;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.stereotype.Service;

import com.bean.PaymentBean;

import net.authorize.Environment;
import net.authorize.api.contract.v1.*;
import net.authorize.api.controller.CreateTransactionController;
import net.authorize.api.controller.base.ApiOperationBase;

@Service
public class ChargeCreditCard {
    public static ANetApiResponse run(PaymentBean bean) {
        String apiLoginId = "66r3YfWx";
        String transactionKey = "3QT2v5VPy4666mUK";
        ApiOperationBase.setEnvironment(Environment.SANDBOX);

        MerchantAuthenticationType merchantAuthenticationType = new MerchantAuthenticationType();
        merchantAuthenticationType.setName(apiLoginId);
        merchantAuthenticationType.setTransactionKey(transactionKey);

        PaymentType paymentType = new PaymentType();
        CreditCardType creditCard = new CreditCardType();
        creditCard.setCardNumber(bean.getCardnumber());
        creditCard.setExpirationDate(bean.getExpiryDate());
        paymentType.setCreditCard(creditCard);

        CustomerDataType customer = new CustomerDataType();
        customer.setEmail("sumitroyaltechnosoft7@gmail.com");

        TransactionRequestType txnRequest = new TransactionRequestType();
        txnRequest.setTransactionType(TransactionTypeEnum.AUTH_CAPTURE_TRANSACTION.value());
        txnRequest.setPayment(paymentType);
        txnRequest.setCustomer(customer);
        txnRequest.setAmount(new BigDecimal(bean.getTotalamount()).setScale(2, RoundingMode.CEILING));

        CreateTransactionRequest apiRequest = new CreateTransactionRequest();
        apiRequest.setMerchantAuthentication(merchantAuthenticationType);
        apiRequest.setTransactionRequest(txnRequest);

        CreateTransactionController controller = new CreateTransactionController(apiRequest);
        controller.execute();

        CreateTransactionResponse response = controller.getApiResponse();

        if (response != null) {
            if (response.getMessages().getResultCode() == MessageTypeEnum.OK) {
                TransactionResponse result = response.getTransactionResponse();
                if (result.getMessages() != null) {
                    System.out.println("Successfully created transaction with Transaction ID: " + result.getTransId());
                    System.out.println("Response Code: " + result.getResponseCode());
                    System.out.println("Message Code: " + result.getMessages().getMessage().get(0).getCode());
                    System.out.println("Description: " + result.getMessages().getMessage().get(0).getDescription());
                    System.out.println("Auth Code: " + result.getAuthCode());
                } else {
                    System.out.println("Failed Transaction.");
                    if (result.getErrors() != null) {
                        System.out.println("Error Code: " + result.getErrors().getError().get(0).getErrorCode());
                        System.out.println("Error message: " + result.getErrors().getError().get(0).getErrorText());
                    }
                }
            } else {
                System.out.println("Failed Transaction.");
                if (response.getTransactionResponse() != null && response.getTransactionResponse().getErrors() != null) {
                    System.out.println("Error Code: " + response.getTransactionResponse().getErrors().getError().get(0).getErrorCode());
                    System.out.println("Error message: " + response.getTransactionResponse().getErrors().getError().get(0).getErrorText());
                } else {
                    System.out.println("Error Code: " + response.getMessages().getMessage().get(0).getCode());
                    System.out.println("Error message: " + response.getMessages().getMessage().get(0).getText());
                }
            }
        } else {
            ANetApiResponse errorResponse = controller.getErrorResponse();
            System.out.println("Failed to get response");
            if (!errorResponse.getMessages().getMessage().isEmpty()) {
                System.out.println("Error: " + errorResponse.getMessages().getMessage().get(0).getCode() + " \n" + errorResponse.getMessages().getMessage().get(0).getText());
            }
        }

        return response;
    }
}
