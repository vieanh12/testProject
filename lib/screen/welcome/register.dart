import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Xử lý đăng ký thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thành công!')),
      );
      // Điều hướng đến trang User Page hoặc Login
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
        backgroundColor: Color(0xFF8ea383),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tạo tài khoản mới',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Tên người dùng',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tên người dùng không được để trống';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailPhoneController,
                decoration: InputDecoration(
                  labelText: 'Email hoặc Số điện thoại',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email hoặc Số điện thoại không được để trống';
                  }
                  final emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  final phoneRegex = RegExp(r"^\d{10}$");
                  if (!emailRegex.hasMatch(value) &&
                      !phoneRegex.hasMatch(value)) {
                    return 'Vui lòng nhập email hoặc số điện thoại hợp lệ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mật khẩu không được để trống';
                  }
                  if (value.length < 8) {
                    return 'Mật khẩu phải có ít nhất 8 ký tự';
                  }
                  if (!RegExp(r'[A-Za-z]').hasMatch(value) ||
                      !RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Mật khẩu phải chứa cả chữ và số';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Xác nhận mật khẩu',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Xác nhận mật khẩu không được để trống';
                  }
                  if (value != _passwordController.text) {
                    return 'Mật khẩu không khớp';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _register,
                  child: Text('Đăng ký'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8ea383),
                    padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Đã có tài khoản? Đăng nhập',
                    style: TextStyle(color: Color(0xFF8ea383)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
