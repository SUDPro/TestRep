package ru.itis.services;

import ru.itis.entities.Trip;
import ru.itis.forms.TripForm;

import java.util.List;

public interface TripService {

    List<Trip> findAll();
    Trip findById(Long id);
    void save(TripForm form);
    boolean nameIsUnique(String name);
}
