package com.example.paydemo.controller;

import com.example.paydemo.service.PaymentService;
import com.example.paydemo.service.dto.PaymentReqDto;
import com.example.paydemo.service.dto.PaymentResDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/payments")
@RequiredArgsConstructor
public class PaymentController {
    private final PaymentService paymentService;

    @PostMapping
    public ResponseEntity<PaymentResDto> chargePoint(@RequestBody final PaymentReqDto paymentReqDto){
        return ResponseEntity.status(HttpStatus.OK).body(paymentService.saveData(paymentReqDto));
    }
}
