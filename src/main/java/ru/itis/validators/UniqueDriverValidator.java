package ru.itis.validators;

import org.springframework.beans.factory.annotation.Autowired;
import ru.itis.services.DriverService;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueDriverValidator implements ConstraintValidator<UniqueDriverName, String> {
    @Autowired
    DriverService driverService;

    public void initialize(UniqueTripName constraint) {
    }

    public boolean isValid(String login, ConstraintValidatorContext context) {
        return isUnique(login, context);
    }

    public boolean isUnique(String name, ConstraintValidatorContext context) {
        boolean valid = true;
        if (!driverService.nameIsUnique(name)) {
            valid = false;
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Name is already in use").addConstraintViolation();
        }
        return valid;
    }
}

