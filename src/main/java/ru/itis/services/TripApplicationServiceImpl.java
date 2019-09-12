package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.entities.StudentApplication;
import ru.itis.entities.Trip;
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
        if (!repository.findByUserAndTrip(application.getUser(), application.getTrip()).isPresent()) {
            repository.save(application);
            Trip trip = tripRepository.findById(application.getTrip().getId()).get();
            Integer inBus = tripRepository.findAllById(application.getTrip().getId()).get().getInBus();
            trip.setInBus(inBus + 1);
            tripRepository.save(trip);
            return true;
        } else {
            System.out.println("Student is registered");
            return false;
        }
    }

    @Override
    public boolean delete(StudentApplication application) {
        if (repository.findByUserAndTrip(application.getUser(), application.getTrip()).isPresent()) {
            repository.deleteById(repository.findByUserAndTrip(application.getUser(), application.getTrip()).get().getId());
            Trip trip = tripRepository.findById(application.getTrip().getId()).get();
            Integer inBus = tripRepository.findAllById(application.getTrip().getId()).get().getInBus();
            trip.setInBus(inBus - 1);
            tripRepository.save(trip);
            return true;
        } else {
            System.out.println("Student is deleted");
            return false;
        }
    }
}
