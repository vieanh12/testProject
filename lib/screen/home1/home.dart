import 'package:flutter/material.dart';
import 'package:test2/screen/user/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Chỉ mục hiện tại trong BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Điều hướng khi chọn mục Tài khoản
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF8EA383), // Màu nền thanh trên
        title: GestureDetector(
          onTap: () {
            // Chuyển đến HomePage khi nhấp vào text
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text(
            'Gourmet', // Thay bằng tên ứng dụng
            style: TextStyle(
              fontFamily: 'SedgwickAve', // Sử dụng font Sedgwick Ave
              fontSize: 32, // Kích thước chữ
              color: Colors.white, // Màu chữ
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Xử lý khi nhấn vào giỏ hàng
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Giỏ hàng của bạn hiện đang trống!')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Mục ${_selectedIndex + 1} hiện đang được chọn.',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white, // Màu chữ khi mục được chọn
        unselectedItemColor: Colors.black54, // Màu chữ khi mục không được chọn
        backgroundColor: Color(0xFF8EA383), // Màu nền thanh dưới
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Đặt hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),

        ],
      ),
    );
  }
}
