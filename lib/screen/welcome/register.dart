import 'package:flutter/material.dart';
import 'package:test2/screen/welcome/login.dart';
import 'package:test2/screen/welcome/welcome_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailorphoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Regular expression for password validation
  bool validatePassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$');
    return passwordRegex.hasMatch(password);
  }

  void registerUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Gửi API đăng ký (tạm thời hiển thị thông báo thành công)
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Thành công"),
            content: Text("Đăng ký tài khoản thành công!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay về trang Welcome
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Đăng ký",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Tên người dùng",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập tên người dùng.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailorphoneController,
                  decoration: InputDecoration(
                    labelText: "Email, SĐT",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập email hoặc số điện thoại.";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) &&
                        !RegExp(r'^\d{10}$').hasMatch(value)) {
                      return "Email hoặc Số điện thoại không hợp lệ.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu.";
                    }
                    if (!validatePassword(value)) {
                      return "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ và số.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Xác nhận mật khẩu",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng xác nhận mật khẩu.";
                    }
                    if (value != _passwordController.text) {
                      return "Mật khẩu không khớp.";
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
                  onPressed: _isLoading ? null : registerUser,
                  child: _isLoading
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text("Đăng ký"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bạn đã có tài khoản? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => LoginPage())
                        );// Điều hướng tới LoginPage
                      },
                      child: Row(
                        children: [
                          Text(
                            "Đăng nhập ngay",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
