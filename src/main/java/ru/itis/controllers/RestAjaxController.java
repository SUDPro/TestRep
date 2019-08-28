package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.itis.entities.Driver;
import ru.itis.services.DriverService;

import java.util.List;

@RestController
public class RestAjaxController {

    @Autowired
    DriverService driverService;

    @GetMapping("/api/getDriverNames")
    public ResponseEntity<Object> getDriversName(@RequestParam("name") String name) {
        List<Driver> drivers = driverService.getDriverName(name);
        return ResponseEntity.ok(drivers);
    }
}
