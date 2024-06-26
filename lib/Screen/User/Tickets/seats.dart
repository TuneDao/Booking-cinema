import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/config/const.dart';
import 'package:provider/provider.dart';

class SeatsSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SeatSelectionModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: colorTheme,
            title: const Text(
              'Chọn ghế',
              style: titleStyle,
            ),
            automaticallyImplyLeading: true,
          ),
          body: SeatSelectionScreen(),
        ),
      ),
    );
  }
}

class SeatSelectionModel extends ChangeNotifier {
  final int rows = 10;
  final int cols = 14;

  final List<List<Seat>> seats = List.generate(
    10,
    (i) => List.generate(
      14,
      (j) => Seat(i, j, SeatType.standard),
    ),
  );

  SeatSelectionModel() {
    // Example of setting some seats as VIP and unavailable
    for (int i = 0; i < cols; i++) {
      seats[7][i].type = SeatType.vip;
      seats[8][i].type = SeatType.vip;
      seats[9][i].type = SeatType.couple;
    }
    seats[5][7].type = SeatType.unavailable;
    seats[5][6].type = SeatType.unavailable;
  }

  void toggleSeat(int row, int col) {
    if (seats[row][col].type != SeatType.unavailable) {
      seats[row][col].isSelected = !seats[row][col].isSelected;
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
}

enum SeatType { standard, vip, unavailable, couple }

class SeatSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seatModel = Provider.of<SeatSelectionModel>(context);

    return Container(
      color: Colors.grey[850],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'MÀN HÌNH',
              style:
                  TextStyle(color: Colors.grey, wordSpacing: 5, fontSize: 30),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: seatModel.cols,
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
                            ? Colors.grey
                            : seat.type == SeatType.unavailable
                                ? Colors.black
                                : seat.type == SeatType.vip
                                    ? colorTheme
                                    : seat.type == SeatType.couple
                                        ? Colors.pinkAccent[700]
                                        : Colors.blueGrey,
                      ),
                      child: Center(
                        child: Text(
                          '${row + 1}${String.fromCharCode(65 + col)}',
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LegendItem(color: Colors.blueGrey, text: 'Thường'),
                    LegendItem(color: colorTheme, text: 'VIP'),
                    LegendItem(color: Colors.grey, text: 'Đã chọn'),
                    LegendItem(color: Colors.black, text: 'Không thể chọn'),
                    LegendItem(
                        color: Colors.pinkAccent.shade700, text: 'Ghế đôi'),
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
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        textWhite(text: 'Suất chiếu'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(text: 'Phòng chiếu'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(text: 'Ghế'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(
                          text: 'Tiền vé',
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        textWhite(text: '10:15, 25/06/2024'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(text: 'Cinema 3'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(text: '4G'),
                        SizedBox(
                          height: 8.0,
                        ),
                        textWhite(
                          text: '75,000đ',
                        )
                      ],
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    ElevatedButton(
                        onPressed: null,
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ))
                  ],
                ),
              ))
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
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
