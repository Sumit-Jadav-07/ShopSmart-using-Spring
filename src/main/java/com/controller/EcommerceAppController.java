package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.EcommerceAppBean;
import com.dao.UserDao;
import com.util.Validators;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.service.OtpService;

@Controller
public class EcommerceAppController {

    @Autowired
    private Validators validator;

    @Autowired
    UserDao userDao;

    @Autowired
    BCryptPasswordEncoder encoder;

    @Autowired
    OtpService otpService;

    @Autowired
    JavaMailSender sender;

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
    public String login(@RequestParam("email") String rEmail, @RequestParam("password") String rPassword, Model model,
            HttpServletResponse response) {
        // StringBuilder to store error messages
        StringBuilder emailErrors = new StringBuilder();
        StringBuilder passwordErrors = new StringBuilder();
        boolean authenticateStatus = true;
        EcommerceAppBean dbUser = null;
        // Validate email
        if (rEmail == null || rEmail.trim().length() == 0) {
            emailErrors.append("Please enter email");
            authenticateStatus = false;
        }
        // Validate password
        if (rPassword == null || rPassword.trim().length() == 0) {
            passwordErrors.append("Please enter password");
            authenticateStatus = false;
        }
        // Authenticate user
        if (authenticateStatus) {
            dbUser = userDao.getUserByEmail(rEmail);
            // Check if user exists
            if (dbUser == null) {
                emailErrors.append("Email doesn't exist<br>");
                authenticateStatus = false;
            } else {
                String encryptedPassword = dbUser.getPassword();
                // Check if password is correct
                if (!encoder.matches(rPassword, encryptedPassword)) {
                    passwordErrors.append("Wrong password<br>");
                    authenticateStatus = false;
                }
            }
        }
        // Add error messages to the model
        if (!emailErrors.toString().isEmpty()) {
            model.addAttribute("emailError", emailErrors.toString());
        }
        if (!passwordErrors.toString().isEmpty()) {
            model.addAttribute("passwordError", passwordErrors.toString());
        }
        // Add email and password to the model
        model.addAttribute("rEmail", rEmail);
        model.addAttribute("rPassword", rPassword);
        // Redirect based on authentication status
        if (authenticateStatus) {
            // session.setAttribute("user", dbUser);
            Cookie cookie = new Cookie("user", dbUser.getId().toString());
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            cookie.setMaxAge(15 * 24 * 60 * 60);
            response.addCookie(cookie);
            if (dbUser.getRole().equalsIgnoreCase("admin")) {
                return "redirect:/admindashboard";
            } else {
                return "redirect:/customerdashboard";
            }
        } else {
            return "Login";
        }
    }

    @GetMapping("/sendotppage")
    public String sendotpPage() {
        return "SendOtp";
    }

    @PostMapping("/sendotp")
    public String sendotp(@RequestParam("email") String rEmail, Model model, HttpSession session) {
        StringBuilder emailErrors = new StringBuilder();
        boolean found = true;
        if (rEmail == null || rEmail.trim().length() == 0) {
            emailErrors.append("Please enter email");
            found = false;
        }
        if (found) {
            EcommerceAppBean dbUser = userDao.getUserByEmail(rEmail);
            if (dbUser == null) {
                emailErrors.append("Email doesn't exist<br>");
                found = false;
            } else {
                String otp = otpService.getOtp();
                System.out.println("Otp: " + otp);

                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("noreplyonthisemail7@gmail.com");
                message.setTo(rEmail);
                message.setSubject("Your OTP Code");
                message.setText("Your OTP code is : " + otp);
                sender.send(message);
                session.setAttribute("genratedOtp", otp);
            }
        }

        if (!emailErrors.toString().isEmpty()) {
            model.addAttribute("emailError", emailErrors.toString());
        }
        model.addAttribute("rEmail", rEmail);
        if (found) {
            return "Forgetpassword";
        } else {
            return "SendOtp";
        }
    }

    @GetMapping("/forgetpasswordpage")
    public String forgetPasswordPage() {
        return "Forgetpassword";
    }

    @PostMapping("/forgetpassword")
    public String ForgetPassword(EcommerceAppBean ecom, Model model, HttpSession session) {

        String emailError = validator.emailValidation(ecom.getEmail(), model);
        String passwordError = validator.passwordValidation(ecom.getNewpass(), model);
        String cpasswordError = validator.cpassValidation(ecom.getNewpass(), ecom.getConfirmnewpass(), model);

        String genratedOtp = (String) session.getAttribute("genratedOtp");
        String otpError = validator.otpValidation(genratedOtp, ecom.getOtp(), model);

        model.addAttribute("ecom", ecom);

        if (!emailError.isEmpty() || !passwordError.isEmpty() || !cpasswordError.isEmpty() || !otpError.isEmpty()) {
            return "Forgetpassword";
        } else {
            ecom.setPassword(encoder.encode(ecom.getNewpass()));
            userDao.updatePassword(ecom);
            session.removeAttribute("generatedOtp");
            return "Login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("user", null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "redirect:/loginpage";
    }

}
