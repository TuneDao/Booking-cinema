import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:project_android/Screen/User/News/detailnews.dart';
import 'package:project_android/config/const.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Tab(), // Remove const keyword here
    );
  }
}

class NewsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String content;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.9;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNews(
              imageUrl: imageUrl,
              title: title,
              content: content,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: imageWidth,
              height: imageWidth * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: imageWidth,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // Tránh tràn nội dung
                maxLines:
                    2, // Giới hạn số dòng để giữ nội dung trong phạm vi hình ảnh
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: imageWidth,
              child: Text(
                description,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
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
            backgroundColor: colorTheme,
            unselectedBackgroundColor: colorHome,
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(
              color: Colors.white,
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      NewsItem(
                        imageUrl: 'assets/images/student.jpg',
                        title: 'C’STUDENT - 45K CHO HS/SV ',
                        content: "Condition:\n"
                            "- HSSV xuất trình thẻ HSSV hoặc CCCD từ dưới 22 tuổi.\n"
                            "- Giảng viên/ giáo viên xuất trình thẻ giảng viên.\n"
                            "\nNote:\n"
                            "- Mỗi thẻ mua được một vé.\n"
                            "- Không áp dụng cho các ngày Lễ, Tết, hoặc suất chiếu có phụ thu từ nhà phát hành phim.\n",
                        description:
                            'Đồng giá 45K/2D cho HSSV/GV/U22 cả tuần tại HFCinema.',
                      ),
                      NewsItem(
                        imageUrl: 'assets/images/uudai1.jpg',
                        title: 'C’MONDAY - HAPPY DAY - ĐỒNG GIÁ 45K/ 2D',
                        content: "Condition:\n"
                            "- Áp dụng cho các suất chiếu vào ngày thứ 2 hàng tuần.\n"
                            "- Mua vé trực tiếp tại App/Web Cinestar hoặc mua trực tiếp tại rạp.\n"
                            "\nNote:\n"
                            "Không áp dụng cho các ngày lễ/tết.\n",
                        description:
                            'Đồng giá 45K/2D, 55K/3D vào thứ 2 hàng tuần.',
                      ),

                      // Add more items here...
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      NewsItem(
                        imageUrl: 'assets/images/kong&godzilla.png',
                        title: 'Godzilla x Kong',
                        content:
                            "Godzilla vs Kong là phần phim mới nhất trong Vũ trụ Điện ảnh MonsterVerse, hứa hẹn mang đến những pha hành động mãn nhãn và những màn đối đầu nghẹt thở giữa hai titans hùng mạnh nhất hành tinh."
                            "Godzilla, Vua Quái vật, là một cỗ máy hủy diệt khổng lồ với sức mạnh nguyên tử kinh hoàng. Sau nhiều lần bảo vệ Trái Đất khỏi những mối đe dọa khác, Godzilla giờ đây phải đối mặt với một đối thủ mới đầy formidable: Kong, Bậc thầy Đảo Đầu Lâu."
                            "Kong, với sức mạnh phi thường và trí thông minh vượt trội, là vị thần hộ mệnh của Đảo Đầu Lâu. Bị buộc phải rời khỏi quê hương của mình, Kong buộc phải đụng độ Godzilla trong một trận chiến định mệnh sẽ quyết định số phận của cả hai và cả thế giới."
                            "Godzilla vs Kong là một bộ phim dành cho những ai yêu thích những pha hành động hoành tráng, những quái vật khổng lồ và những câu chuyện sử thi. Phim hứa hẹn sẽ mang đến cho khán giả những trải nghiệm điện ảnh vô cùng mãn nhãn và khó quên."
                            "Đừng bỏ lỡ Godzilla vs Kong - Khởi chiếu tại các rạp vào ngày [ngày khởi chiếu]!",
                        description:
                            'Nhận ngay ưu đãi đặc biệt khi mua vé xem Godzilla x Kong.',
                      ),
                      NewsItem(
                        imageUrl: 'assets/images/conan.jpg',
                        title: 'THÁM TỬ LỪNG DANH CONAN',
                        content:
                            "Trở lại với phần phim mới PHIM ĐIỆN ẢNH THÁM TỬ LỪNG DANH CONAN: NGÔI SAO 5 CÁNH 1 TRIỆU ĐÔ trong năm 2024, "
                            "Thám Tử Lừng Danh Conan khiến khán giả vô cùng háo hức khi lâu rồi mới có sự tham gia của siêu trộm Kaito Kid."
                            "Lần này, Kaito Kid tiếp tục đụng độ Conan trong những vụ án hóc búa, hứa hẹn mang đến những màn đối đầu, đấu trí lẫn lực vô cùng gay cấn.\n"
                            "Song, mối quan hệ giữa Conan và Kaito Kid vẫn luôn khá phức tạp, vừa bạn vừa thù và còn nhiều khả năng có sự liên hệ sâu xa hơn trong movie 27 lần này. "
                            "",
                        description: 'NGÔI SAO 5 CÁNH 1 TRIỆU ĐÔ.',
                      ),

                      // Add more items here...
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
