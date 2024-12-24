import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/resetpassword.dart';

class OtpVerifyPage extends StatefulWidget {
  final String identifier; // Email hoặc số điện thoại
  final bool isPhone; // true nếu là số điện thoại

  OtpVerifyPage({required this.identifier, required this.isPhone});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerifyPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  void verifyOtp() async {
    String otp = _otpController.text;

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mã OTP không được để trống.")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Giả lập gọi API
    await Future.delayed(Duration(seconds: 2)); // Thay thế bằng API thực tế
    bool isValidOtp = await checkOtpApi(widget.identifier, otp);

    setState(() {
      _isLoading = false;
    });

    if (isValidOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Xác minh OTP thành công!")),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(
            identifier: widget.identifier,
            isPhone: widget.isPhone,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mã OTP không hợp lệ.")),
      );
    }
  }

  Future<bool> checkOtpApi(String identifier, String otp) async {
    // Gửi API kiểm tra OTP
    // Đây là ví dụ giả lập - thay bằng logic API thực tế
    if (identifier == "test@example.com" && otp == "123456") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xác Thực OTP"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.isPhone
                  ? "Nhập mã OTP gửi đến số điện thoại ${widget.identifier}"
                  : "Nhập mã OTP gửi đến email ${widget.identifier}",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Mã OTP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: verifyOtp,
              child: Text("Xác Minh OTP"),
            ),
          ],
        ),
      ),
    );
  }
}

