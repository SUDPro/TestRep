package ru.itis.forms;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserForm {
    String name;
    String surname;

    @Email
    String email;
    String password;
    String address;
}
