import 'package:flutter/material.dart';
import 'package:test2/model/user.dart';

class RegisterPage extends StatelessWidget {
  final Function(User) onRegisterSuccess;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  RegisterPage({Key? key, required this.onRegisterSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8EA383),
        title: const Text('Đăng ký'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
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
                // Demo register
                onRegisterSuccess(User(
                  name: _nameController.text,
                  imageUrl: 'https://via.placeholder.com/60',
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8EA383),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}