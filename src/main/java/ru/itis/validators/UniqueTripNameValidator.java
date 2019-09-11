package ru.itis.validators;

import org.springframework.beans.factory.annotation.Autowired;
import ru.itis.services.TripService;


import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueTripNameValidator implements ConstraintValidator<UniqueTripName, String> {

    @Autowired
    TripService tripService;

    public void initialize(UniqueTripName constraint) {
    }

    public boolean isValid(String name, ConstraintValidatorContext context) {
        return isUnique(name, context);
    }

    public boolean isUnique(String name, ConstraintValidatorContext context) {
        boolean valid = true;
        if (!tripService.nameIsUnique(name)) {
            valid = false;
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Name is already in use").addConstraintViolation();
        }
        return valid;
    }
}


