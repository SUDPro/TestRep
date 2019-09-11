package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.entities.User;
import ru.itis.forms.UserForm;
import ru.itis.services.UserService;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class SignUpController {

    @Autowired
    UserService userService;

    @GetMapping("/reg")
    public String getRegPage(Authentication authentication) {
        if (authentication != null) {
            return "redirect:/profile";
        }
        return "reg";
    }

    @PostMapping("/reg")
    public String regUser(@Valid UserForm userForm, BindingResult result, ModelMap modelMap) {
        if (result.hasErrors()) {
            modelMap.addAttribute("error", result.getFieldError().getDefaultMessage());
            return "/reg";
        }
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
