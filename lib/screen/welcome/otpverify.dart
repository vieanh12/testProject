import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/resetpassword.dart';

class OTPVerificationPage extends StatelessWidget {
  final String identifier;
  final bool isPhone;

  OTPVerificationPage({required this.identifier, required this.isPhone});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Xác minh OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isPhone
                  ? 'Nhập mã OTP được gửi đến số điện thoại: $identifier'
                  : 'Nhập mã OTP được gửi đến email: $identifier',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: 'Mã OTP'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String otp = otpController.text.trim();
                if (otp.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vui lòng nhập mã OTP!')));
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                );
              },
              child: Text('Xác minh'),
            ),
          ],
        ),
      ),
    );
  }
}
