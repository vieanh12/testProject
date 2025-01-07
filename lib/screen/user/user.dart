import 'package:flutter/material.dart';
import 'dart:io';

class UserPage extends StatelessWidget {
  final bool isLoggedIn;
  final String? username;
  final String? avatarPath;

  UserPage({this.isLoggedIn = false, this.username, this.avatarPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài khoản'),
        backgroundColor: Color(0xFF8ea383),
      ),
      body: Container(
        color: Color(0xFF8ea383), // Màu nền cho trang
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoggedIn
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Logic đổi ảnh đại diện
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: avatarPath != null
                        ? FileImage(File(avatarPath!))
                        : AssetImage('assets/avatar_placeholder.png')
                    as ImageProvider,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  username ?? "Tên người dùng",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildOption('Lịch sử đặt hàng'),
              Divider(color: Colors.white),
              _buildOption('Điểm thưởng'),
              Divider(color: Colors.white),
              _buildOption('Cài đặt tài khoản'),
              Divider(color: Colors.white),
              _buildOption('Đăng xuất'),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hãy tạo tài khoản để tận hưởng ưu đãi dành riêng cho bạn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF8ea383),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF8ea383),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: Text(
                      'Đăng ký',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
