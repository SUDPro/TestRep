package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.entities.User;
import ru.itis.forms.UserForm;
import ru.itis.services.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class SignUpController {

    @Autowired
    UserService userService;

    @GetMapping("/reg")
    public String getRegPage(){
        return "reg";
    }

    @PostMapping("/reg")
    public String regUser(UserForm userForm){
        userService.save(userForm);
        System.out.println(userForm.getAddress());
        return "redirect:/auth";
    }

    @InitBinder
    public void initBinder(WebDataBinder wb) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        wb.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
}
