package com.example.paydemo.domain;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name="payment")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="payment_id")
    private Long paymentId;

    @Column(name="amount")
    private Long amount;

    @Column(name="name")
    private String name;

    @Column(name="address")
    private String address;

    @Column(name="postcode")
    private String postcode;

    @Column(name="phone_number")
    private String phoneNumber;

    @Builder
    public Payment(Long amount, String name, String address, String postcode, String phoneNumber){
        this.amount = amount;
        this.name = name;
        this.address = address;
        this.postcode = postcode;
        this.phoneNumber = phoneNumber;
    }
}
