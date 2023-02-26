class ApiConst {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey = "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8yT1RNMU16SjkuVm8xV21GQ2FTUnZFSTAyNmE3UXJ4OWh6bkkzQWF2d1M1NmhZdm9oR1U2YjdhaW00SHZrU3c2TXJOZjJZZGllak1IVXEzYTYzcFVQVGRvMEhDMjJIWXc=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/424000?payment_token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '3384661';
  static const String integrationIdKiosk = '3384661';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "";
  static const String visaImage =
      "";
}