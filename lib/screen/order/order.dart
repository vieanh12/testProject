import 'package:flutter/material.dart';
import 'package:test2/screen/template.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = -1; // Chỉ số của ô được chọn (-1 nghĩa là chưa chọn gì)

  // Danh sách dữ liệu cho 5 ô
  final List<Map<String, String>> categories = [
    {'title': 'Khuyến mại', 'image': 'assets/img/icon/promo.png'},
    {'title': 'Gà', 'image': 'assets/img/icon/chic.png'},
    {'title': 'Bò', 'image': 'assets/img/icon/steakk.png'},
    {'title': 'Mì', 'image': 'assets/img/icon/spgtt.png'},
    {'title': 'Hamburger', 'image': 'assets/img/icon/hamb.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      currentIndex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Danh mục',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Carousel lướt thủ công
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                    (index) => _buildCategory(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget cho từng ô ảnh
  Widget _buildCategory(int index) {
    final category = categories[index];
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Cập nhật chỉ số của ô được chọn
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(isSelected ? 4.0 : 0.0), // Thêm viền nếu được chọn
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.green, width: 2.0) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(category['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category['title']!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
