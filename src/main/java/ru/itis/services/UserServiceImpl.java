package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.entities.Role;
import ru.itis.entities.User;
import ru.itis.forms.UserForm;
import ru.itis.repository.postgres.UsersRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UsersRepository usersRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void save(UserForm form) {
        User user  = User.builder()
                .email(form.getEmail())
                .name(form.getName())
                .surname(form.getSurname())
                .address(form.getAddress())
                .passwordHash(passwordEncoder.encode(form.getPassword()))
                .date(form.getDate())
                .role(Role.STUDENT)
                .build();
        usersRepository.save(user);
    }

    @Override
    public User findByUserRole(String role) {
       return usersRepository.findUserByRole(role).get();
    }

    @Override
    public User getByEmail(String email) {
        return null;
    }

    @Override
    public User getById(Long id) {
        return null;
    }
}
