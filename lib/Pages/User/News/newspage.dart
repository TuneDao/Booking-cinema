import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('ƯU ĐÃI'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('TIN TỨC'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            NewsItem(
              imageUrl:
                  'assets/images/kong&godzilla.png', // Replace with actual image URL
              title: 'Godzilla x Kong: Đế Chế Mới',
              description:
                  'Trailer đầu tiên của siêu bom tấn 2024 "Godzilla x Kong" chính thức thả xích, hai siêu quái vật càn quét phòng vé trở lại',
            ),
            NewsItem(
              imageUrl:
                  'assets/images/garfield.png', // Replace with actual image URL
              title: 'Garfield x Mèo Béo Siêu Quậy',
              description:
                  'Mèo vàng Garfield siêu quậy quay trở lại trong bộ phim mới nhất Garfield Movie. Đón xem vào dịp hè năm 2024',
            ),
          ],
        ),
      ),
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
