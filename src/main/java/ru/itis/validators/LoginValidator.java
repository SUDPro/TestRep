package ru.itis.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import ru.itis.security.UserDetailsImpl;
import ru.itis.services.UserService;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;


public class LoginValidator implements ConstraintValidator<Login, String> {

    @Autowired
    UserService userService;

    public void initialize(Login constraint) {
    }

    public boolean isValid(String login, ConstraintValidatorContext context) {
        return isUnique(login, context);
    }

    public boolean isUnique(String login, ConstraintValidatorContext context) {
        boolean valid = true;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken) && ((UserDetailsImpl)auth.getPrincipal()).getUser().getEmail().equals(login)) {
            return true;
        }
        if (!userService.emailIsUnique(login)) {
            valid = false;
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Email is already in use").addConstraintViolation();
        }
        return valid;
    }


}