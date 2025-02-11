import 'package:flutter/material.dart';
import 'package:test2/screen/template.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Khởi tạo selectedIndex = 0 để luôn chọn ô đầu tiên (Khuyến mại)
  int selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Khuyến mại',
      'image': 'assets/img/icon/promo.png',
      'products': [
        {'name': 'Combo gà rán', 'price': '89.000đ', 'image': 'assets/img/products/combo1.png'},
        {'name': 'Combo hamburger', 'price': '79.000đ', 'image': 'assets/img/products/combo2.png'},
        {'name': 'Combo mì Ý', 'price': '99.000đ', 'image': 'assets/img/products/combo3.png'},
      ]
    },
    {
      'title': 'Gà',
      'image': 'assets/img/icon/chic.png',
      'products': [
        {'name': 'Gà rán giòn', 'price': '35.000đ', 'image': 'assets/img/products/chicken1.png'},
        {'name': 'Gà sốt cay', 'price': '39.000đ', 'image': 'assets/img/products/chicken2.png'},
        {'name': 'Cánh gà BBQ', 'price': '45.000đ', 'image': 'assets/img/products/chicken3.png'},
      ]
    },
    {
      'title': 'Bò',
      'image': 'assets/img/icon/steakk.png',
      'products': [
        {'name': 'Bò nướng phô mai', 'price': '59.000đ', 'image': 'assets/img/products/beef1.png'},
        {'name': 'Bò sốt nấm', 'price': '65.000đ', 'image': 'assets/img/products/beef2.png'},
        {'name': 'Bò BBQ', 'price': '55.000đ', 'image': 'assets/img/products/beef3.png'},
      ]
    },
    {
      'title': 'Mì',
      'image': 'assets/img/icon/spgtt.png',
      'products': [
        {'name': 'Mì Ý sốt bò', 'price': '45.000đ', 'image': 'assets/img/products/pasta1.png'},
        {'name': 'Mì hải sản', 'price': '55.000đ', 'image': 'assets/img/products/pasta2.png'},
        {'name': 'Mì sốt kem', 'price': '42.000đ', 'image': 'assets/img/products/pasta3.png'},
      ]
    },
    {
      'title': 'Hamburger',
      'image': 'assets/img/icon/hamb.png',
      'products': [
        {'name': 'Burger bò phô mai', 'price': '39.000đ', 'image': 'assets/img/products/burger1.png'},
        {'name': 'Burger gà', 'price': '35.000đ', 'image': 'assets/img/products/burger2.png'},
        {'name': 'Burger đặc biệt', 'price': '49.000đ', 'image': 'assets/img/products/burger3.png'},
      ]
    },
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                    (index) => _buildCategory(index),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Sản phẩm ${categories[selectedIndex]['title']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories[selectedIndex]['products'].length,
              itemBuilder: (context, index) {
                final product = categories[selectedIndex]['products'][index];
                return _buildProductItem(product);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(int index) {
    final category = categories[index];
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(isSelected ? 4.0 : 0.0),
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
                  image: AssetImage(category['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category['title'],
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(Map<String, String> product) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(product['image']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          product['name']!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product['price']!,
          style: TextStyle(color: Colors.green),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_circle_outline, color: Colors.green),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã thêm ${product['name']} vào giỏ hàng'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}