package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class Services {

  @Autowired
  HttpServletRequest request;

  public String getUserId() {
    Cookie[] cookies = request.getCookies();
    String userId = null;

    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if ("user".equals(cookie.getName())) {
          userId = cookie.getValue();
          break;
        }
      }
    }
    return userId;
  }

}
