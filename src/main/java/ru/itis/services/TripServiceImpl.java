package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import ru.itis.entities.Trip;
import ru.itis.forms.TripForm;
import ru.itis.repository.postgres.DriverRepository;
import ru.itis.repository.postgres.TripRepository;

import java.util.Date;
import java.util.List;

@Service
public class TripServiceImpl implements TripService {

    @Autowired
    TripRepository repository;

    @Autowired
    DriverRepository driverRepository;

    @Override
    public List<Trip> findAll() {
        return repository.findAll();
    }

    @Override
    public Trip findById(Long id) {
        return repository.findAllById(id).get();
    }

    @Override
    public void save(TripForm form) {
        Trip trip = Trip.builder()
                .name(form.getName())
                .start(form.getStart())
                .finish(form.getFinish())
                .driver(driverRepository.findByName(form.getDriver()).get())
                .date(form.getDate())
                .build();
        repository.save(trip);
    }

    @Scheduled(cron = "*/10 * * * * *")
    @Override
    public void closeTripsForApplicationsWithOverDueDeadline() {
        repository.findAllByDateBefore(new Date())
                .forEach(
                        trip -> {
                            trip.setOpen(false);
                            repository.save(trip);
                        });
    }

    @Override
    public List<Trip> showOnlyOpenTrips(){
        return repository.findAllByOpenTrue();
    }

    @Override
    public boolean nameIsUnique(String name) {
        return !repository.findByName(name).isPresent();
    }
}
