package ru.itis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.entities.StudentApplication;
import ru.itis.forms.TripForm;
import ru.itis.security.UserDetailsImpl;
import ru.itis.services.TripApplicationsService;
import ru.itis.services.TripService;

@Controller
public class TripController {

    @Autowired
    TripService tripService;

    @Autowired
    TripApplicationsService service;

    @GetMapping("/new_trip")
    public String getTripPage(){
        return "newTrip";
    }

    @PostMapping ("/new_trip")
    public String addTrip(TripForm tripForm){
        tripService.save(tripForm);
        return "redirect:/trips";
    }

    @GetMapping("/trips")
    public String getTripsPage(ModelMap modelMap){
        modelMap.addAttribute("trips", tripService.findAll());
        return "TripList";
    }

    @GetMapping("/trip/{id}")
    public String getOneTrip(ModelMap modelMap, @PathVariable Long id){
        modelMap.addAttribute("users", service.findAllByTripId(id));
        modelMap.addAttribute("trip", tripService.findById(id));
        return "oneTrip";
    }
    @PostMapping(value = "/trip/{id}", params = {"apply"})
    public String applyAdd(@PathVariable Long id, Authentication auth){
        StudentApplication application = StudentApplication.builder()
                .trip(tripService.findById(id))
                .user(((UserDetailsImpl)(auth.getPrincipal())).getUser())
                .build();
        service.save(application);
        return "redirect:/trip/"+ id;
    }
}
