package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.entities.StudentApplication;
import ru.itis.entities.User;
import ru.itis.repository.StudentApplicationRepository;
import ru.itis.repository.TripRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class TripApplicationServiceImpl implements TripApplicationsService {

    @Autowired
    StudentApplicationRepository repository;

    @Autowired
    TripRepository tripRepository;

    @Override
    public List<User> findAllByTripId(Long id) {
        List<StudentApplication> applications = repository.findAllByTrip(tripRepository.findAllById(id).get());
        List<User> addresses = new ArrayList<>();
        for (StudentApplication application
                : applications) {
            addresses.add(application.getUser());
        }
        return addresses;
    }

    @Override
    public void save(StudentApplication application) {
        repository.save(application);
    }
}
