import 'package:flutter/material.dart';
import 'package:test2/screen/home1/home.dart';
import 'package:test2/screen/order/order.dart';

class TemplateScreen extends StatelessWidget {
  final Widget child;
  final int currentIndex;

  const TemplateScreen({required this.child, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8EA383),
        title: Center(
          child: Text(
            'GOURMET',
            style: TextStyle(fontFamily: 'SedgwickAve', fontSize: 24,),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Logic điều hướng tới giỏ hàng
            },
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF8EA383),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == currentIndex) return;

          // Điều hướng dựa trên index
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
              break;
            case 2:
            // Placeholder cho màn hình thông báo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Chức năng Thông báo chưa được triển khai')),
              );
              break;
            case 3:
            // Placeholder cho màn hình tài khoản
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Chức năng Tài khoản chưa được triển khai')),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
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
