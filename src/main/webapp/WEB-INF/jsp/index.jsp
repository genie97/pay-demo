<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
    $(document).on("click", "#charge_kakao", function () {
        // step1. 가맹점 식별하기
        var IMP = window.IMP;
        IMP.init(''); // 가맹점 식별코드 삽입

        // step2. 충전하고자 하는 금액
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        // step3. 결제창 호출 코드
        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '결제 테스트',
            amount: money,
            buyer_email: 'gildong@gmail.com',
            buyer_name: '홍길동',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) { // 결제 성공시: 가맹점 서버에서 통신
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "POST",
                    url: "/api/payments", //충전 금액값을 보낼 url 설정
                    contentType: "application/json;charset=UTF-8",
                    dataType: 'json',
                    data: JSON.stringify({
                        "amount": money,
                        "name": rsp.buyer_name,
                        "address": rsp.buyer_addr,
                        "postcode": rsp.buyer_postcode,
                        "phoneNumber": rsp.buyer_tel
                    }),
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href = "/"
        });
    });
</script>
<div class="container">
    <div class="mt-5 align-content-center text-center">
        <h3>페이 API 데모</h3>
        <div class="card-group">
            <div class="card border-warning mr-1 text-center col-6">
                <div class="card-header bg-warning text-center">
                    카카오페이
                </div>
                <div class="card-body">
                    <div class="input-group mb-1">
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
                        <label class="btn btn-warning col-3 m-3"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
                    </div>
                </div>
                <p style="color: #ac2925; margin-top: 30px">최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
                <div class="mb-5" style="margin: auto 0;">
                    <button type="button" class="btn btn-warning col-xs-6 col-sm-4" id="charge_kakao">충 전 하 기</button>
                </div>
            </div>

            <div class="card border-success mr-1 text-center col-6">
                <div class="card-header bg-success text-center">
                    네이버페이
                </div>
                <div class="card-body">
                    <div class="input-group mb-1">
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
                        <label class="btn btn-success col-3 m-3"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
                    </div>
                </div>
                <p style="color: #ac2925; margin-top: 30px">최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
                <div class="mb-5" style="margin: auto 0;">
                    <button type="button" class="btn btn-success col-xs-6 col-sm-4" id="charge_naver">충 전 하 기</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>