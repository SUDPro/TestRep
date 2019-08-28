package ru.itis.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MapController {



    @GetMapping("/map")
    public String getMapPage(){
        return "map";
    }
}
