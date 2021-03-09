package com.pereir4.bankapp.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoansController {

    @GetMapping("/myLoans")
    public String getLoansDetails(String input) {
        return "Loan details from Data Base";
    }

}
