package com.kontrolery;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestControler {

    @GetMapping("/getString")
    public String getString(){
        return "zwykły tekst";
    }
}
