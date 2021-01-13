package com.example.paydemo.controller;

import com.example.paydemo.service.PaymentService;
import com.example.paydemo.service.dto.PaymentReqDto;
import com.example.paydemo.service.dto.PaymentResDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }
}
