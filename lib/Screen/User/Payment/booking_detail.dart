import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/booking.dart';
import 'package:project_android/config/const.dart';

class BookingDetail extends StatelessWidget {
  Map<String, dynamic> booking = {};

  BookingDetail({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final phim = booking['DatVe']['Phim'];
    final date = booking['ThoiGianTT'];
    DateTime dateTime = DateTime.parse(date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          phim['TenPhim'],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorTheme,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    phim['AnhPhim'],
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                phim['TenPhim'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.orange, size: 24),
                  const SizedBox(width: 24),
                  Text(
                    'Ngày đặt: ' + DateFormat('dd/MM/yyyy').format(dateTime),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green, size: 24),
                  const SizedBox(width: 24),
                  Text(
                    'Giá tiền: ' +
                        NumberFormat('###,### VND')
                            .format(booking['DatVe']['GiaTien']),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.local_activity, color: Colors.blue, size: 24),
                  const SizedBox(width: 24),
                  Text(
                    'Số lượng vé: ${NumberFormat('###.##').format(booking['DatVe']['GiaTien'] / 70000)}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.white),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.room, color: Colors.red, size: 24),
                  const SizedBox(width: 24),
                  Text(
                    'Phòng chiếu: ${phim['SuatChieux'][0]['RapChieu']}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.calendarCheck,
                      color: Colors.blue, size: 24),
                  const SizedBox(width: 24),
                  Text(
                    'Suất chiếu: ${phim['SuatChieux'][0]['ThoiGianBD']} - ${phim['SuatChieux'][0]['ThoiGianKT']}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.couch, color: Colors.blue, size: 16),
                  const SizedBox(width: 24),
                  Text(
                    'Ghế: ${booking['DatVe']['Ghe']}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
