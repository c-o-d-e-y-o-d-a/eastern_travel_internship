import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj/components/text_feild_num.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:proj/components/my_button.dart';
import 'package:proj/services/auth/auth_service.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController amountController = TextEditingController();
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: 'Payment Success: ${response.paymentId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Payment Failure: ${response.code} - ${response.message}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Make Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 30),
            TextInputFieldNum(
              controller: amountController,
              labelText: 'Amount',
              icon: Icons.attach_money,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Pay Now',
              onTap: () {
                String amountText = amountController.text.trim();
                if (amountText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter an amount')),
                  );
                  return;
                }

                // Check if the input is numeric
                double? amount = double.tryParse(amountText);
                if (amount == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid amount')),
                  );
                  return;
                }

                // Convert amount to paise
                int amountInPaise = (amount * 100).toInt();

                var options = {
                  'key': 'rzp_test_h9vHK8TeO1jqib',// put your test api key here
                  'amount': amountInPaise,
                  'name': authService.currentUser?.email ?? '',
                  'description': 'Fine T-Shirt',
                  'prefill': {
                    'contact': '8888888888', // Example contact
                    'email': authService.currentUser?.email ?? '',
                  }
                };

                try {
                  _razorpay.open(options);
                } catch (e) {
                  Fluttertoast.showToast(msg: 'Error: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
