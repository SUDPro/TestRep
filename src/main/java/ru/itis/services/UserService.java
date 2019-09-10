package ru.itis.services;

import ru.itis.entities.User;
import ru.itis.forms.UserForm;

import java.util.List;

public interface UserService {
    void save(UserForm form);
    User findByUserRole(String role);
    User getByEmail(String email);
    User getById(Long id);
    boolean emailIsUnique(String login);
}
