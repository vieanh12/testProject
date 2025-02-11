import 'package:flutter/material.dart';
import 'package:test2/screen/home1/home.dart'; // Thêm import cho HomePage

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Chuyển đến HomePage sau 4 giây
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Ảnh nền full màn hình
          Image.asset(
            'assets/img/logo/Gourmet3.jpg', // Thay bằng đường dẫn ảnh nền của bạn
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
