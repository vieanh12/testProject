import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test2/screen/template.dart';
import 'package:test2/screen/cart/cart_screen.dart';
import 'package:test2/screen/cart/cart_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> slideImages = [
    'assets/img/food/comboga.jpg',
    'assets/img/food/comboham.jpg',
    'assets/img/food/combosteak.jpg',
  ];

  final List<Map<String, String>> promotions = [
    {
      'image': 'assets/img/food/bwelinton.jpg',
      'title': 'Bò Wellington',
      'oldPrice': '200,000đ',
      'newPrice': '150,000đ',
    },
    {
      'image': 'assets/img/food/ham.jpg',
      'title': 'Hamburger',
      'oldPrice': '300,000đ',
      'newPrice': '250,000đ',
    },
    {
      'image': 'assets/img/food/kfc.jpg',
      'title': 'Gà rán',
      'oldPrice': '250,000đ',
      'newPrice': '200,000đ',
    },
    {
      'image': 'assets/img/food/spgt.jpeg',
      'title': 'Mỳ Spaghetti',
      'oldPrice': '200,000đ',
      'newPrice': '150,000đ',
    },
    {
      'image': 'assets/img/food/steak.jpg',
      'title': 'Steak',
      'oldPrice': '200,000đ',
      'newPrice': '150,000đ',
    },
  ];

  final List<Map<String, String>> newsData = [
    {'image': 'assets/img/logo/news1.png', 'title': 'Khai Trương'},
    {'image': 'assets/img/logo/news2.jpg', 'title': 'Dịch vụ giao hàng'},
    {'image': 'assets/img/logo/news3.jpg', 'title': 'Dịch vụ đặt bàn'},
    {'image': 'assets/img/news4.jpg', 'title': 'Tin tức 4'},
    {'image': 'assets/img/news5.jpg', 'title': 'Tin tức 5'},
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < slideImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      currentIndex: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopButtons(),
            _buildAutoSlide(),
            _buildSectionTitle('Khuyến mại đặc biệt'),
            _buildPromotionSection(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Khoảng trống nhỏ giữa navbar dưới và phần tin tức
            ),
            _buildSectionTitle('Tin tức'),
            _buildNewsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Đặt bàn', style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Giao đi', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAutoSlide() {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: slideImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(slideImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromotionSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: promotions.map((item) {
          return Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            width: MediaQuery.of(context).size.width * 0.48, // Mới: Chia làm 2 phần
            height: 320, // Mới: Gấp đôi chiều cao
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['title']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['oldPrice']!,
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          item['newPrice']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNewsSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newsData.map((item) {
          return Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            width: MediaQuery.of(context).size.width * 0.48, // Mới: Chia làm 2 phần
            height: 270, // Mới: Gấp đôi chiều cao
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['title']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}