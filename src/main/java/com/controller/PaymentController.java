package com.controller;

import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.PaymentBean;
import com.service.ChargeCreditCard;

@Controller
public class PaymentController {
   
    @PostMapping("/checkoutpage")
    public String checkOutPage(PaymentBean bean) {
        return "Checkout";
    }
    @PostMapping("/checkout")
    public String checkOut(@RequestParam("totalPrice") Double amount, PaymentBean bean) {
        bean.setTotalamount(amount);
        System.out.println(bean.getTotalamount());
        ChargeCreditCard.run(bean);
        System.out.println(bean.getTotalamount());
        return "redirect:/customerdashboard";
    }
    
}
