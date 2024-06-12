import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          _Tab(), // Sử dụng trực tiếp _Tab() thay vì một Column không cần thiết
    );
  }
}

class NewsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageUrl),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }
}

class _Tab extends StatefulWidget {
  const _Tab({Key? key}) : super(key: key);

  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<_Tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            backgroundColor: const Color.fromRGBO(246, 217, 62, 1),
            unselectedBackgroundColor: const Color.fromRGBO(0, 173, 239, 1),
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            tabs: const [
              Tab(
                icon: Icon(Icons.discount),
                text: "ƯU ĐÃI",
              ),
              Tab(
                icon: Icon(Icons.newspaper),
                text: "TIN TỨC",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                // Tab "ƯU ĐÃI" với nhiều nội dung
                SingleChildScrollView(
                  child: Column(
                    children: [
                      NewsItem(
                        imageUrl: 'assets/images/kong&godzilla.png',
                        title: 'Ưu đãi Godzilla x Kong',
                        description:
                            'Nhận ngay ưu đãi đặc biệt khi mua vé xem Godzilla x Kong.',
                      ),
                      NewsItem(
                        imageUrl: 'assets/images/garfield.png',
                        title: 'Ưu đãi Garfield Movie',
                        description:
                            'Ưu đãi đặc biệt khi mua vé xem Garfield Movie.',
                      ),

                      // Thêm nhiều nội dung khác ở đây...
                    ],
                  ),
                ),
                // Tab "TIN TỨC"
                SingleChildScrollView(
                  child: Column(
                    children: [
                      NewsItem(
                        imageUrl: 'assets/images/kong&godzilla.png',
                        title: 'Godzilla x Kong: Đế Chế Mới',
                        description:
                            'Trailer đầu tiên của siêu bom tấn 2024 "Godzilla x Kong" chính thức thả xích, hai siêu quái vật càn quét phòng vé trở lại',
                      ),
                      NewsItem(
                        imageUrl: 'assets/images/garfield.png',
                        title: 'Garfield x Mèo Béo Siêu Quậy',
                        description:
                            'Mèo vàng Garfield siêu quậy quay trở lại trong bộ phim mới nhất Garfield Movie. Đón xem vào dịp hè năm 2024.',
                      ),
                      // Thêm nhiều nội dung khác ở đây...
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
