import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> sliderImages = [
    'assets/img/food/comboga.jpg',
    'assets/img/food/combosteak.jpg',
    'assets/img/food/comboham.jpg',
  ];

  final List<String> promoImages = [
    'assets/img/food/bwelinton.jpg',
    'assets/img/food/ham.jpg',
    'assets/img/food/kfc.jpg',
    'assets/img/food/spgt.jpeg',
    'assets/img/food/steak.jpg',
  ];

  final List<String> newsImages = [
    'assets/news1.jpg',
    'assets/news2.jpg',
    'assets/news3.jpg',
    'assets/news4.jpg',
    'assets/news5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAEFDA), // Thêm màu nền
      appBar: AppBar(
        backgroundColor: Color(0xFF8EA383),
        title: Text(
          'GOURMET',
          style: TextStyle(
          fontFamily: 'SedgwickAve',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Xử lý sự kiện giỏ hàng
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hai ô "Đặt bàn" và "Giao đi"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Đặt bàn'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8EA383),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Giao đi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8EA383),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2. 3 slide ảnh tự động lướt
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                height: 200,
                viewportFraction: 1.0,
              ),
              items: sliderImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Đường cong 50%
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // 3. Phần "Khuyến mại đặc biệt"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Khuyến mại đặc biệt',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promoImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(promoImages[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),

            // 4. Phần "Tin tức"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tin tức',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(newsImages[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        backgroundColor: Color(0xFF8EA383),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Đặt hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
