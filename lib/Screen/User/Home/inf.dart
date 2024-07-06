import 'package:flutter/material.dart';

class MovieTheaterPage extends StatefulWidget {
  @override
  _MovieTheaterPageState createState() => _MovieTheaterPageState();
}

class _MovieTheaterPageState extends State<MovieTheaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 0), // Khoảng cách giữa AppBar và ảnh
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg-inf.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'HFCinema là một trong những hệ \nthống rạp chiếu phim được yêu \nthích nhất tại Việt Nam. ',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/bg-inf.jpg',
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image),
                    ),
                  ),
                  const SizedBox(width: 16), // Khoảng cách giữa ảnh và nội dung
                  const Expanded(
                    child: Text(
                      'Chúng tôi tự hào mang đến cho bạn trải nghiệm xem phim đỉnh cao với hệ thống âm thanh và hình ảnh hiện đại\n'
                      "Chúng tôi cam kết mang lại cho bạn những giây phút thư giãn và giải trí tuyệt vời.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  'Sứ Mệnh',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Container(
                width: double.infinity, // Chiều ngang theo màn hình
                padding: const EdgeInsets.all(16.0),

                decoration: BoxDecoration(
                  color: const Color.fromRGBO(218, 33, 67, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '01',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Colors.yellow, // Đổi màu số thành màu xanh lá cây
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Khoảng cách giữa số và nội dung
                    Text(
                      'Góp phần tăng trưởng thị phần điện ảnh\n'
                      'văn hóa, giải trí của người Việt Nam',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Container(
                width: double.infinity, // Chiều ngang theo màn hình
                padding: const EdgeInsets.all(16.0),

                decoration: BoxDecoration(
                  color: const Color.fromRGBO(218, 33, 67, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // child: Text(
                //   '02\n'
                //   'Phát triển dịch vụ xuất sắc với mức giá\n'
                //   'tối ưu, phù hợp với thu nhâp người Việt Nam',
                //   style: TextStyle(fontSize: 16, color: Colors.white),
                //   textAlign: TextAlign.center,
                // ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '02',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Colors.yellow, // Đổi màu số thành màu xanh lá cây
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Khoảng cách giữa số và nội dung
                    Text(
                      'Phát triển dịch vụ xuất sắc với mức giá\n'
                      'tối ưu, phù hợp với thu nhâp người Việt Nam',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: Container(
                width: double.infinity, // Chiều ngang theo màn hình
                padding: const EdgeInsets.all(16.0),

                decoration: BoxDecoration(
                  color: const Color.fromRGBO(218, 33, 67, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // child: Text(
                //   '03\n'
                //   'Mang nghệ thuật, điện ảnh, văn hóa Việt Nam\n'
                //   'hội nhập quốc tế',
                //   style: TextStyle(fontSize: 16, color: Colors.white),
                //   textAlign: TextAlign.center,
                // ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '03',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            Colors.yellow, // Đổi màu số thành màu xanh lá cây
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Khoảng cách giữa số và nội dung
                    Text(
                      'Mang nghệ thuật, điện ảnh, văn hóa Việt Nam\n'
                      'hội nhập quốc tế',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10), // Khoảng cách giữa các phần tử
            Padding(
              padding: const EdgeInsets.all(
                  16.0), // Khoảng cách top và bottom cho phần hệ thống cụm rạp
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Hệ Thống Cụm Rạp',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        height: 10), // Khoảng cách giữa tiêu đề và nội dung
                    const Text(
                      'Các phòng chiếu được trang bị các thiết bị tiên tiến như hệ thống âm thanh vòm, màn hình rộng và độ phân giải cao, '
                      'tạo nên hình ảnh sắc nét và âm thanh sống động.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        height: 20), // Khoảng cách giữa nội dung và ảnh
                    // Đoạn code để chèn ảnh chiếm một nửa chiều cao của màn hình
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/map.jpg', // Đường dẫn đến ảnh của bạn
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height *
                                  0.9, // Chiều cao là một nửa màn hình
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
