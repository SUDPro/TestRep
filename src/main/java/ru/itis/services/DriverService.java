package ru.itis.services;

import ru.itis.entities.Driver;
import ru.itis.forms.DriverForm;
import ru.itis.forms.UserForm;

import java.util.List;
import java.util.Optional;

public interface DriverService {

    void save(DriverForm form);

    Optional<Driver> findById(Long id);

    List<Driver> getDriverName(String name);

    boolean nameIsUnique(String name);
}
