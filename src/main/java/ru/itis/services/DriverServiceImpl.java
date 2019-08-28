package ru.itis.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.entities.Driver;
import ru.itis.forms.DriverForm;
import ru.itis.forms.UserForm;
import ru.itis.repository.DriverRepository;

import java.util.List;
import java.util.Optional;
@Service
public class DriverServiceImpl implements DriverService {

    @Autowired
    DriverRepository driverRepository;

    @Override
    public void save(DriverForm form) {
        Driver driver = Driver.builder()
                .license(form.getLicense())
                .name(form.getName())
                .build();
        driverRepository.save(driver);
    }

    @Override
    public Optional<Driver> findById(Long id) {
        return driverRepository.findAllById(id);
    }

    @Override
    public List<Driver> getDriverName(String name) {
        return driverRepository.searchDriversByName(name);
    }
}
