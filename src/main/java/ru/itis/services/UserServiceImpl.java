package ru.itis.services;

import jdk.nashorn.internal.parser.JSONParser;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.itis.entities.Role;
import ru.itis.entities.User;
import ru.itis.forms.UserForm;
import ru.itis.repository.postgres.UsersRepository;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UsersRepository usersRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void save(UserForm form) {
        User user = User.builder()
                .email(form.getEmail())
                .name(form.getName())
                .surname(form.getSurname())
                .address(form.getAddress())
                .passwordHash(passwordEncoder.encode(form.getPassword()))
                .coordinates(getCoordinates(form.getAddress()))
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

    @Override
    public boolean emailIsUnique(String login) {
        return !usersRepository.findUserByEmail(login).isPresent();
    }

    @Override
    public String getCoordinates(String address) {
        String addressForUri = address.replaceAll(" ", "+");
        final String uri =
                "https://geocode-maps.yandex.ru/1.x/?apikey=0f81e2ba-2097-4277-afdd-754647ceee0d&geocode=" + addressForUri;
        RestTemplate restTemplate = new RestTemplate();
        String stroka = restTemplate.getForObject(uri, String.class);
        String longitute = ((stroka.split("<pos>")[1]).split("</pos>")[0]).split(" ")[0];
        String altitude = ((stroka.split("<pos>")[1]).split("</pos>")[0]).split(" ")[1];
        return altitude + "," + longitute;
    }
}
