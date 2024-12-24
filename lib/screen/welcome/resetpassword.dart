import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/login.dart';

class ResetPasswordPage extends StatefulWidget {
  final String identifier; // Email hoặc số điện thoại
  final bool isPhone; // Xác định loại đầu vào

  ResetPasswordPage({required this.identifier, required this.isPhone});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _otpVerified = false; // Đánh dấu đã xác minh OTP hay chưa

  void verifyOtp() {
    if (_otpController.text == "123456") { // Mã OTP giả lập
      setState(() {
        _otpVerified = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mã OTP xác minh thành công!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mã OTP không hợp lệ.")),
      );
    }
  }

  void resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Xử lý API đặt lại mật khẩu
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Thành công"),
          content: Text("Mật khẩu của bạn đã được đặt lại!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng dialog
                Navigator.pop(context); // Quay lại trang Login
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isPhone ? "Xác Thực OTP" : "Đặt Lại Mật Khẩu"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.isPhone
                    ? "Nhập mã OTP gửi đến ${widget.identifier}"
                    : "Đặt lại mật khẩu cho ${widget.identifier}",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (widget.isPhone && !_otpVerified) ...[
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mã OTP",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: verifyOtp,
                  child: Text("Xác Minh OTP"),
                ),
              ],
              if (!_otpVerified && widget.isPhone) SizedBox(height: 20),
              if (!_otpVerified && widget.isPhone) Divider(),
              if (_otpVerified || !widget.isPhone) ...[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu mới",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Vui lòng nhập mật khẩu.";
                          }
                          if (value.length < 8) {
                            return "Mật khẩu phải có ít nhất 8 ký tự.";
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
                        onPressed: resetPassword,
                        child: Text("Đặt Lại Mật Khẩu"),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
