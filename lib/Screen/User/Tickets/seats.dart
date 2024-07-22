import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Screen/User/Payment/payment.dart';
import 'package:project_android/config/const.dart';
import 'package:provider/provider.dart';

class SeatsSelect extends StatelessWidget {
  final Film_API film;

  SeatsSelect({required this.film});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SeatSelectionModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: colorTheme,
            title: const Text(
              'Chọn ghế',
              style: titleStyle,
            ),
          ),
          body: SeatSelectionScreen(film: film),
        ),
      ),
    );
  }
}

class SeatSelectionModel extends ChangeNotifier {
  final int rows = 9;
  final int cols = 9;
  final int seatPrice = 70000;

  final List<List<Seat>> seats = List.generate(
    9,
    (i) => List.generate(
      9,
      (j) => Seat(i, j, SeatType.standard),
    ),
  );

  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

  SeatSelectionModel() {
    // Example of setting some seats as unavailable
    List<List<int>> unavailableSeats = [
      [5, 7],
      [5, 6],
      [2, 3],
      [2, 6],
      [3, 6],
      [2, 7],
      [8, 4],
      [8, 3],
      [7, 6],
      [7, 5]
    ];
    for (var seat in unavailableSeats) {
      seats[seat[0]][seat[1]].type = SeatType.unavailable;
    }
  }

  void toggleSeat(int row, int col) {
    if (seats[row][col].type != SeatType.unavailable) {
      seats[row][col].isSelected = !seats[row][col].isSelected;
      _totalPrice += seats[row][col].isSelected ? seatPrice : -seatPrice;
      notifyListeners();
    }
  }
}

class Seat {
  final int row;
  final int col;
  SeatType type;

  bool isSelected = false;

  Seat(this.row, this.col, this.type);

  static fromJson(seatJson) {}

  toJson() {}
}

enum SeatType {
  standard,
  unavailable,
}

class SeatSelectionScreen extends StatelessWidget {
  final Film_API film;

  SeatSelectionScreen({required this.film});

  @override
  Widget build(BuildContext context) {
    final seatModel = Provider.of<SeatSelectionModel>(context);

    return Container(
      color: const Color(0xFF303030),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: CustomPaint(
              size: const Size(350, 50),
              painter: ScreenCurvePainter(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: seatModel.rows,
                  childAspectRatio: 1.0,
                ),
                itemCount: seatModel.rows * seatModel.cols,
                itemBuilder: (context, index) {
                  final row = index ~/ seatModel.cols;
                  final col = index % seatModel.cols;
                  final seat = seatModel.seats[row][col];

                  return GestureDetector(
                    onTap: () => seatModel.toggleSeat(row, col),
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: seat.isSelected
                            ? Colors.green
                            : seat.type == SeatType.unavailable
                                ? Colors.black
                                : Colors.blueGrey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          '${String.fromCharCode(65 + row)}${col + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LegendItem(color: Colors.green, text: 'Đã chọn'),
                    LegendItem(color: Colors.black, text: 'Không thể chọn'),
                    LegendItem(color: Colors.blueGrey, text: 'Có thể chọn'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [colorTheme, Colors.black],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Bottom(totalPrice: seatModel.totalPrice, film: film),
          )
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  final int totalPrice;
  final Film_API film;

  const Bottom({super.key, required this.totalPrice, required this.film});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWhite(text: 'Tên phim'),
              SizedBox(height: 8.0),
              textWhite(text: 'Suất chiếu'),
              SizedBox(height: 8.0),
              textWhite(text: 'Tổng tiền:')
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                film.tenPhim,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 8.0),
              Text(
                film.theLoai,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8.0),
              Text(
                NumberFormat('###,### đ').format(totalPrice),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                    film: film,
                    totalPrice: totalPrice,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(12.0),
            ),
            child: const Icon(
              FontAwesomeIcons.arrowRight,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
