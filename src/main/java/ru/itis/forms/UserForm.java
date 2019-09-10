package ru.itis.forms;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import ru.itis.validators.Login;

import javax.validation.constraints.Email;
import javax.validation.constraints.Past;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserForm {
    String name;
    String surname;

    @Email
    @Login
    String email;
    String password;
    String address;

    @Past
    Date date;
}
