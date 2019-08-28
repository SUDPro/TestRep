package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.entities.User;
import ru.itis.forms.DriverForm;
import ru.itis.security.UserDetailsImpl;
import ru.itis.services.DriverService;
import ru.itis.services.UserService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    DriverService driverService;

    @GetMapping("/profile")
    public String getPage(ModelMap modelMap, Authentication auth){
        modelMap.addAttribute("user", ((UserDetailsImpl)(auth.getPrincipal())).getUser());
        return "profile";
    }

    @GetMapping("/new_driver")
    public String getNewDriverPage(){
        return "newDriver";
    }

    @PostMapping("/new_driver")
    public String addNewDriver(DriverForm form){
        driverService.save(form);
        return "redirect:/profile";
    }


}
