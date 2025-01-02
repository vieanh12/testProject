import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserPage extends StatefulWidget {
  final bool isLoggedIn; // Kiểm tra trạng thái đăng nhập
  final String? userName; // Tên người dùng (nếu có)
  final String? avatarUrl; // URL ảnh đại diện (nếu có)

  const UserPage({
    Key? key,
    this.isLoggedIn = false,
    this.userName,
    this.avatarUrl,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? avatarPath; // Đường dẫn ảnh đại diện đã chọn
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    isLoggedIn = widget.isLoggedIn;
    avatarPath = widget.avatarUrl;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        avatarPath = pickedFile.path; // Cập nhật ảnh đại diện
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài khoản'),
        centerTitle: true,
        backgroundColor: const Color(0xFF8EA383),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoggedIn
            ? Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: avatarPath != null
                    ? FileImage(File(avatarPath!))
                    : const AssetImage('assets/default_avatar.png') as ImageProvider,
                child: avatarPath == null
                    ? const Icon(Icons.add_a_photo, size: 40, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.userName ?? 'Người dùng chưa đặt tên',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    title: 'Lịch sử đặt hàng',
                    icon: Icons.history,
                    onTap: () => _showSnackBar('Lịch sử đặt hàng đang được phát triển'),
                  ),
                  _buildMenuItem(
                    title: 'Cài đặt tài khoản',
                    icon: Icons.settings,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountSettingsPage(),
                      ),
                    ),
                  ),
                  _buildMenuItem(
                    title: 'Mục tương tác',
                    icon: Icons.favorite_border,
                    onTap: () => _showSnackBar('Mục tương tác đang được phát triển'),
                  ),
                  _buildMenuItem(
                    title: 'Các tính năng bổ sung',
                    icon: Icons.star,
                    onTap: () => _showSnackBar('Các tính năng bổ sung đang được phát triển'),
                  ),
                  _buildMenuItem(
                    title: 'Đăng xuất',
                    icon: Icons.logout,
                    onTap: () {
                      setState(() {
                        isLoggedIn = false; // Chuyển về trạng thái chưa đăng nhập
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Đăng nhập'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF8EA383)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt tài khoản'),
        backgroundColor: const Color(0xFF8EA383),
      ),
      body: ListView(
        children: [
          _buildSettingItem('Tài khoản của bạn', Icons.account_circle),
          _buildSettingItem('Địa chỉ', Icons.location_on),
          _buildSettingItem('Phương thức thanh toán', Icons.payment),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF8EA383)),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Thêm logic chuyển hướng tới trang chi tiết
      },
    );
  }
}
