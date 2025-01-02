import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final Function(String name, String avatarUrl) onRegister;

  RegisterPage({required this.onRegister});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailOrPhoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    // Hàm kiểm tra dữ liệu đầu vào
    String? validateInput(String username, String emailOrPhone, String password, String confirmPassword) {
      // Kiểm tra trống
      if (username.isEmpty || emailOrPhone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        return 'Vui lòng điền đầy đủ thông tin!';
      }

      // Kiểm tra email/số điện thoại
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      final phoneRegex = RegExp(r'^\d{10}$');
      if (!emailRegex.hasMatch(emailOrPhone) && !phoneRegex.hasMatch(emailOrPhone)) {
        return 'Email hoặc số điện thoại không đúng định dạng!';
      }

      // Kiểm tra độ mạnh của mật khẩu
      final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
      if (!passwordRegex.hasMatch(password)) {
        return 'Mật khẩu phải ít nhất 8 ký tự và bao gồm cả chữ và số!';
      }

      // Kiểm tra mật khẩu xác nhận
      if (password != confirmPassword) {
        return 'Mật khẩu xác nhận không khớp!';
      }

      return null; // Không có lỗi
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đăng ký',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Tên người dùng'),
            ),
            TextField(
              controller: emailOrPhoneController,
              decoration: InputDecoration(labelText: 'Email hoặc số điện thoại'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
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
                String username = usernameController.text.trim();
                String emailOrPhone = emailOrPhoneController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();

                // Kiểm tra dữ liệu
                String? errorMessage = validateInput(username, emailOrPhone, password, confirmPassword);
                if (errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                  return;
                }

                // Giả lập đăng ký thành công
                String avatarUrl = 'https://example.com/avatar.png'; // URL ảnh đại diện

                // Callback thông tin đăng ký
                onRegister(username, avatarUrl);

                // Điều hướng về màn hình trước
                Navigator.pop(context);
              },
              child: Text('Đăng ký'),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Điều hướng về màn hình Đăng nhập
              },
              child: Text(
                'Đã có tài khoản? Đăng nhập ngay',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
