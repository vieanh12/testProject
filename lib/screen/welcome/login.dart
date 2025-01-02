import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/register.dart';

class LoginPage extends StatelessWidget {
  final Function(String name, String avatarUrl) onLogin;

  LoginPage({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailOrPhoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // Hàm kiểm tra dữ liệu đầu vào
    String? validateInput(String emailOrPhone, String password) {
      // Kiểm tra trống
      if (emailOrPhone.isEmpty || password.isEmpty) {
        return 'Vui lòng điền đầy đủ thông tin!';
      }

      // Kiểm tra email/số điện thoại
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      final phoneRegex = RegExp(r'^\d{10}$');
      if (!emailRegex.hasMatch(emailOrPhone) && !phoneRegex.hasMatch(emailOrPhone)) {
        return 'Email hoặc số điện thoại không đúng định dạng!';
      }

      return null; // Không có lỗi
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đăng nhập',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailOrPhoneController,
              decoration: InputDecoration(labelText: 'Email hoặc số điện thoại'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String emailOrPhone = emailOrPhoneController.text.trim();
                String password = passwordController.text.trim();

                // Kiểm tra dữ liệu
                String? errorMessage = validateInput(emailOrPhone, password);
                if (errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                  return;
                }

                // Giả lập đăng nhập thành công
                String userName = 'User Example';
                String avatarUrl = 'https://example.com/avatar.png'; // URL ảnh đại diện

                // Callback thông tin đăng nhập
                onLogin(userName, avatarUrl);

                // Điều hướng về màn hình chính
                Navigator.pop(context);
              },
              child: Text('Đăng nhập'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(onRegister: (name, avatarUrl) {
                          // Xử lý callback khi đăng ký thành công
                          onLogin(name, avatarUrl);
                        }),
                      ),
                    );
                  },
                  child: Text(
                    'Bạn chưa có tài khoản? Đăng ký ngay',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Giả lập ForgotPasswordPage
class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quên mật khẩu'),
      ),
      body: Center(
        child: Text('Trang Quên mật khẩu'),
      ),
    );
  }
}
