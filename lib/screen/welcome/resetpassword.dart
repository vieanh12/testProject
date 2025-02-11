import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    String? validatePassword(String password, String confirmPassword) {
      if (password.isEmpty || confirmPassword.isEmpty) {
        return 'Vui lòng điền đầy đủ thông tin!';
      }
      if (password.length < 8) {
        return 'Mật khẩu phải chứa ít nhất 8 ký tự!';
      }
      final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
      if (!passwordRegex.hasMatch(password)) {
        return 'Mật khẩu phải bao gồm cả chữ và số!';
      }
      if (password != confirmPassword) {
        return 'Mật khẩu xác nhận không khớp!';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt lại mật khẩu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Đặt lại mật khẩu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu mới'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Xác nhận mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();
                String? errorMessage = validatePassword(password, confirmPassword);
                if (errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đặt lại mật khẩu thành công!')));
                Navigator.popUntil(context, (route) => route.isFirst); // Quay về trang đầu tiên
              },
              child: Text('Đặt lại mật khẩu'),
            ),
          ],
        ),
      ),
    );
  }
}
