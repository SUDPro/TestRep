package ru.itis.services;

import ru.itis.entities.StudentApplication;
import ru.itis.entities.User;

import java.util.List;

public interface TripApplicationsService {

    List<User> findAllByTripId(Long id);

    boolean save(StudentApplication application);
}
