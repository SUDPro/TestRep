package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.services.UserService;

@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @GetMapping("/auth")
    public String getAuthPage(){
        return "auth";
    }

}
