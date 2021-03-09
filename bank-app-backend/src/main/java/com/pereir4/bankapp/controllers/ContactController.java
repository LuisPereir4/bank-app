package com.pereir4.bankapp.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactController {

    @GetMapping("/contact")
    public String saveContactDetails(String input) {
        return "Contact details saved on Data Base";
    }

}
