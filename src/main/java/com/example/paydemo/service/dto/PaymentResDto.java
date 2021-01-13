package com.example.paydemo.service.dto;

import com.example.paydemo.domain.Payment;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PaymentResDto {
    private Long paymentId;
    public PaymentResDto(Payment payment) {
        this.paymentId = payment.getPaymentId();
    }
}
