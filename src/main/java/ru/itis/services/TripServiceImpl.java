package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
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
                .quota(form.getQuota())
                .open(true)
                .inBus(0)
                .startCoordinates(getCoordinates(form.getStart()))
                .finishCoordinates(getCoordinates(form.getFinish()))
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
