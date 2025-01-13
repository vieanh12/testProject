import 'package:flutter/material.dart';
import 'package:test2/screen/home1/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gourmet App',
      theme: ThemeData(
        primaryColor: Color(0xFF8EA383),
        scaffoldBackgroundColor: Color(0xFFDAEFDA), // Màu nền toàn bộ ứng dụng
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Chuyển sang HomeScreen sau 3 giây
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/logo/Gourmet3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
