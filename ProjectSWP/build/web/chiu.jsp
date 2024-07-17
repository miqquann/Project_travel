<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>VNPay Refund</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#frmCreateOrder").submit(function(event) {
                event.preventDefault();
                var postData = $(this).serialize();
                var submitUrl = $(this).attr("action");

                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'json',
                    success: function(response) {
                        if (response.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: response.data});
                            } else {
                                location.href = response.data;
                            }
                        } else {
                            alert(response.message);
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form action="vnpayrefund" id="frmCreateOrder" method="post">
        <input type="hidden" name="order_id" value="${o.id}">
        <input type="hidden" name="amount" value="${o.price}">
        <input type="hidden" name="trantype" value="02">
        <input type="hidden" name="trans_date" value="${o.vnp_PayDate}">
        <input type="hidden" name="user" value="${sessionScope.account.email}">
        <input type="submit" value="HỦY">
    </form>
</body>
</html>
