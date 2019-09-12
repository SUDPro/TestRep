package ru.itis.validators;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = UniqueDriverValidator.class)
public @interface UniqueDriverName {

    String message() default "Это имя уже используется";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
