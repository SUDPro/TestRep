package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.entities.StudentApplication;
import ru.itis.entities.User;
import ru.itis.repository.postgres.StudentApplicationRepository;
import ru.itis.repository.postgres.TripRepository;

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
    public boolean save(StudentApplication application) {
        if (!repository.findByUserAndAndTrip(application.getUser(), application.getTrip()).isPresent()){
            repository.save(application);
            return true;
        } else {
            System.out.println("Student is registered");
            return false;
        }
    }
}
