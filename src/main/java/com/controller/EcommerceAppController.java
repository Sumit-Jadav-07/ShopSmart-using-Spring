package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.EcommerceAppBean;
import com.dao.UserDao;
import com.util.Validators;

@Controller
public class EcommerceAppController {

    @Autowired
    private Validators validator;

    @Autowired
    UserDao userDao;

    @Autowired
    BCryptPasswordEncoder encoder;

    @GetMapping("/homepage")
    public String HomePage() {
        return "Home";
    }

    @GetMapping("/signuppage")
    public String SignUpPage() {
        return "Signup";
    }

    @PostMapping("/signUp")
    public String signUp(EcommerceAppBean ecom, Model model) {
        String fullnameError = validator.fullNameValidation(ecom.getFullname(), model);
        String emailError = validator.emailValidation(ecom.getEmail(), model);
        String passwordError = validator.passwordValidation(ecom.getConfirmpassword(), model);
        String cpasswordError = validator.cpassValidation(ecom.getPassword(), ecom.getConfirmpassword(), model);

        model.addAttribute("ecom", ecom);

        if (!fullnameError.isEmpty() || !emailError.isEmpty() || !passwordError.isEmpty()
                || !cpasswordError.isEmpty()) {
            return "Signup";
        } else {
            // String pass = ecom.getPassword();
            // String encryptedPass = encoder.encode(pass); //--------- First method to
            // encrypt password
            // ecom.setPassword(encryptedPass);
            ecom.setPassword(encoder.encode(ecom.getPassword())); // -------Second method to encypt password
            userDao.insertUser(ecom);
            return "Login";
        }
    }

    @GetMapping("/loginpage")
    public String LoginPage() {
        return "Login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String rEmail, @RequestParam("password") String rPassword, Model model) {
        StringBuilder emailErrors = new StringBuilder();
        StringBuilder passwordErrors = new StringBuilder();
        boolean authenticateStatus = true;

        // Basic validation
        if (rEmail == null || rEmail.trim().length() == 0) {
            emailErrors.append("Please enter email");
            authenticateStatus = false;
        }
        if (rPassword == null || rPassword.trim().length() == 0) {
            passwordErrors.append("Please enter password");
            authenticateStatus = false;
        }

        // Database validation
        if (authenticateStatus) {
            EcommerceAppBean dbUser = userDao.getUserByEmail(rEmail);
            if (dbUser == null) {
                emailErrors.append("Email doesn't exist<br>");
                authenticateStatus = false;
            } else {
                String encryptedPassword = dbUser.getPassword();
                if (!encoder.matches(rPassword, encryptedPassword)) {
                    passwordErrors.append("Wrong password<br>");
                    authenticateStatus = false;
                }
            }
        }

        // Add errors to the model if any
        if (!emailErrors.toString().isEmpty()) {
            model.addAttribute("emailError", emailErrors.toString());
        }
        if (!passwordErrors.toString().isEmpty()) {
            model.addAttribute("passwordError", passwordErrors.toString());
        }

        model.addAttribute("rEmail", rEmail);
        model.addAttribute("rPassword", rPassword);

        // Redirect based on authentication status
        if (authenticateStatus) {
            return "Home";
        } else {
            return "Login";
        }
    }

    @GetMapping("/forgetpasswordpage")
    public String ForgetPasswordPage() {
        return "Forgetpassword";
    }

}
