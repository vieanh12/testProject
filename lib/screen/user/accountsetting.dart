import 'package:flutter/material.dart';
import 'package:test2/screen/user/userprofile.dart';

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt tài khoản'),
        backgroundColor: Color(0xFF8EA383),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Tài khoản của bạn'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Địa chỉ'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mục Địa chỉ đang phát triển')),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Phương thức thanh toán'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mục Phương thức thanh toán đang phát triển')),
              );
            },
          ),
        ],
      ),
    );
  }
}
