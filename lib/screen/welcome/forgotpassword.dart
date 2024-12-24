import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/resetpassword.dart';
import 'package:test2/screen/welcome/otpverify.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleForgotPassword() {
    if (_formKey.currentState!.validate()) {
      final input = _emailOrPhoneController.text;

      // Kiểm tra đầu vào là email hay số điện thoại
      if (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(input)) {
        // Gọi API cho email
        sendEmailApi(input);
      } else if (RegExp(r'^\d{10}$').hasMatch(input)) {
        // Gọi API cho số điện thoại
        sendSmsApi(input);
      } else {
        // Không hợp lệ (nếu validate bị lỗi)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lỗi: Không hợp lệ")),
        );
      }
    }
  }

  void sendEmailApi(String email) {
    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email không hợp lệ.")),
      );
      return;
    }

    // Giả lập gửi OTP qua email
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Đã gửi mã OTP đến $email.")),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpVerifyPage(identifier: email, isPhone: false),
      ),
    );
  }


  void sendSmsApi(String phone) {
    // Gửi API cho số điện thoại
    // Giả lập xử lý thành công
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordPage(
        identifier: phone, // Truyền số điện thoại
        isPhone: true, // Xác định đây là số điện thoại
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quên Mật Khẩu"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang Login
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Quên Mật Khẩu",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailOrPhoneController,
                decoration: InputDecoration(
                  labelText: "Email hoặc Số điện thoại",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập email hoặc số điện thoại.";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) &&
                      !RegExp(r'^\d{10}$').hasMatch(value)) {
                    return "Nhập email hoặc số điện thoại hợp lệ.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: handleForgotPassword,
                child: Text("Gửi mã"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
