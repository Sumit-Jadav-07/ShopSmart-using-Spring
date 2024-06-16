package com.util;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class Validators {

    public String fullNameValidation(String rFullname , Model model) {
		String fullnameError = "";
		String fullnameRegEx = "^[a-zA-Z]+(?: [a-zA-Z]+)*$";
		if(rFullname == null  ||  rFullname.trim().length() == 0) {
			fullnameError = "Please enter fullname";
            
		} else if (rFullname.matches(fullnameRegEx) == false) {
			fullnameError = "Fullname only contains characters";
		}
        model.addAttribute("fullnameError", fullnameError);
		return fullnameError;
	}

    public String emailValidation(String rEmail , Model model) {
		String emailError = "";
		String emailRegEx = "[a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-Z]{2,5}";
		if (rEmail == null || rEmail.trim().length() == 0) {
			emailError = "Please enter email-id";
		} else if (rEmail.matches(emailRegEx) == false) {
			emailError = "Please enter valid email-id";
			
		}
        model.addAttribute("emailError", emailError);
        return emailError;
	}

    public String passwordValidation(String rPass, Model model) {

        String passError = "";
        if (rPass == null || rPass.trim().length() == 0) {
            passError = "Please Enter Password";
        } else if (rPass.length() < 8 || rPass.length() > 16) {
            passError = "Password should be between 8 and 16 characters long";
        } else if (rPass.matches(".*[0-9].*") == false) {
            passError = "Password must have atleast One Digit";
        } else if (rPass.matches(".*[A-Z].*") == false) {
            passError = "Password must have atleast One Upper Character";
        } else if (rPass.matches(".*[a-z].*") == false) {
            passError = "Password must have atleast One Lower Character";
        } else if (rPass.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*") == false) {
            passError = "Password must have atleast One Special Character";
        }
        model.addAttribute("passError", passError);
        return passError;
    }

    public String cpassValidation(String rConfirmPass, String rPass, Model model) {

        String cpassError = "";
        if (rConfirmPass == null || rConfirmPass.trim().length() == 0) {
            cpassError = "Please enter confirm password";
        } else if (rConfirmPass.equals(rPass) == false) {
            cpassError = "Confirm password must be match with password";
        }
        model.addAttribute("cpassError", cpassError);
        return cpassError;
    }

}
