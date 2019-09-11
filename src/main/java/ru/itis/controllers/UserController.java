package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.forms.DriverForm;
import ru.itis.security.UserDetailsImpl;
import ru.itis.services.DriverService;
import ru.itis.services.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    DriverService driverService;

    @GetMapping("/profile")
    public String getPage(ModelMap modelMap, HttpServletRequest request, Authentication auth) {
        modelMap.addAttribute("user", ((UserDetailsImpl) (auth.getPrincipal())).getUser());
        return "profile";
    }

    @GetMapping("/new_driver")
    public String getNewDriverPage() {
        return "newDriver";
    }

    @PostMapping("/new_driver")
    public String addNewDriver(@Valid DriverForm form, BindingResult result, ModelMap modelMap) {
        System.out.println("driver method");
        if (result.hasErrors()) {
            List<String> errors = result
                    .getFieldErrors()
                    .stream()
                    .map(error -> error.getDefaultMessage()).collect(Collectors.toList());
            modelMap.addAttribute("errors", errors);
            return "newDriver";
        }
        driverService.save(form);
        return "redirect:/profile";
    }


}
