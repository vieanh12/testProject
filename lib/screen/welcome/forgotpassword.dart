import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/otpverify.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailOrPhoneController = TextEditingController();

    String? validateInput(String emailOrPhone) {
      if (emailOrPhone.isEmpty) {
        return 'Vui lòng điền email hoặc số điện thoại!';
      }
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      final phoneRegex = RegExp(r'^\d{10}$');
      if (!emailRegex.hasMatch(emailOrPhone) && !phoneRegex.hasMatch(emailOrPhone)) {
        return 'Email hoặc số điện thoại không đúng định dạng!';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quên mật khẩu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quên mật khẩu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: emailOrPhoneController,
              decoration: InputDecoration(labelText: 'Email hoặc số điện thoại'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String emailOrPhone = emailOrPhoneController.text.trim();
                String? errorMessage = validateInput(emailOrPhone);
                if (errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                  return;
                }
                bool isPhone = RegExp(r'^\d{10}$').hasMatch(emailOrPhone);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPVerificationPage(identifier: emailOrPhone, isPhone: isPhone),
                  ),
                );
              },
              child: Text('Gửi liên kết đặt lại mật khẩu'),
            ),
          ],
        ),
      ),
    );
  }
}
