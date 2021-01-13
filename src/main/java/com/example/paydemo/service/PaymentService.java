package com.example.paydemo.service;

import com.example.paydemo.domain.Payment;
import com.example.paydemo.domain.PaymentRepository;
import com.example.paydemo.service.dto.PaymentReqDto;
import com.example.paydemo.service.dto.PaymentResDto;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PaymentService {
    private final PaymentRepository paymentRepository;

    @Transactional
    public PaymentResDto saveData(PaymentReqDto paymentReqDto) {
        Payment payment = paymentReqDto.toEntity();

        paymentRepository.save(payment);

        return new PaymentResDto(payment);
    }
}
