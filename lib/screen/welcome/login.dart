import 'package:flutter/material.dart';
import 'package:test2/model/user.dart';

class LoginPage extends StatelessWidget {
  final Function(User) onLoginSuccess;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({Key? key, required this.onLoginSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8EA383),
        title: const Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Demo login
                onLoginSuccess(User(
                  name: 'Nguyễn Văn A',
                  imageUrl: 'https://via.placeholder.com/60',
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8EA383),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}