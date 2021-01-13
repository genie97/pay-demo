# pay-demo
##### Skills

- Pay API - `아임포트 API` 

  URL: https://www.iamport.kr/ 

- Frontend - `jsp`

- Backend - `Spring Boot` + `JPA`

- Database - `h2`



##### scenario

1. After selecting the amount, click the recharge button

2. Kakao Pay connection

3. Buyer information and amount stored in database



##### Configuration

```yml
spring:
  mvc:
    view:
      prefix: /WEB-INF/jsp/
      suffix: .jsp
      
  h2:
    console:
      enabled: true
      path: /h2-console
      settings:
        trace: false
        web-allow-others: false
        
  datasource:
    username: sa
    password:
    url: jdbc:h2:~/[database Name]

  jpa:
    hibernate:
      ddl-auto: create 
      => (After generating database, change ddl-auto to 'update')
    properties:
      hibernate:
        format_sql: true
```



##### Model

| Colunm       | Type        |
| ------------ | ----------- |
| payment_id   | BIG INTEGER |
| amount       | BIG INTEGER |
| name         | VARCHAR     |
| address      | VARCHAR     |
| postcode     | VARCHAR     |
| phone_number | VARCHAR     |




##### Reference
https://1-7171771.tistory.com/83
