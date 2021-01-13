package com.example.paydemo.service.dto;

import com.example.paydemo.domain.Payment;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PaymentReqDto {
    private Long amount;
    private String name;
    private String address;
    private String postcode;
    private String phoneNumber;

    public Payment toEntity(){
        return Payment.builder()
                .amount(amount)
                .name(name)
                .address(address)
                .postcode(postcode)
                .phoneNumber(phoneNumber)
                .build();
    }
}
