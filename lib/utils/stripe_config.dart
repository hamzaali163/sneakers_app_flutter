import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeConfig {
  Map<String, dynamic>? paymentIntent;

  Future createpaymentintent() async {
    try {
      Map<String, dynamic> body = {
        'amount': '1000',
        'currency': 'USD',
      };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OrEh0IWbhNtVdkSIUVtTFhMo1XaAEVtWnhtMnCL3KCIpjaohTniR8PVxikAleD1akDf3cCPXiEQRMQSNS1pYNnh00ZbReGkhe',
            'Content-Type': 'application/x-www-form-urlencoded',
          });
      return jsonDecode(response.body);
    } catch (e) {
      debugPrint(e.toString());
      //GeneralUtils().showerrorflushbar(e.toString(), BuildContext);
    }
  }

  void displayPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  makepayment(BuildContext context) async {
    try {
      paymentIntent = await createpaymentintent();
      var gpay = const PaymentSheetGooglePay(merchantCountryCode: 'US');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              googlePay: gpay,
              style: ThemeMode.system,
              merchantDisplayName: 'Hamza Ali'));

      displayPayment();
    } catch (e) {
      StripeConfigException(e.toString());
      debugPrint(e.toString());
    }
  }
}
