import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài khoản của bạn'),
        backgroundColor: Color(0xFF8EA383),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên người dùng:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Nguyễn Văn A', // Thay bằng dữ liệu thực tế
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Số điện thoại:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '+84 123 456 789', // Thay bằng dữ liệu thực tế
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'email@example.com', // Thay bằng dữ liệu thực tế
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Chức năng sửa hồ sơ đang phát triển')),
                  );
                },
                child: Text('Sửa hồ sơ'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Color(0xFF8EA383),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
