import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:project_android/Data/model/booking.dart';
import 'package:project_android/Data/provider/bookingprovider.dart';
import 'package:project_android/Screen/User/Payment/booking_detail.dart';
import 'package:project_android/config/const.dart';

class HistoryPayment extends StatefulWidget {
  const HistoryPayment({super.key});

  @override
  _HistoryPaymentState createState() => _HistoryPaymentState();
}

class _HistoryPaymentState extends State<HistoryPayment> {
  String maKH = '';

  Future<List<MovieBooking>> loadBill() async {
    return await ReadDataFodd().loadDataBooking();
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    final userDetails = await SharedPreferencesUtil.getUserDetails();
    setState(() {
      maKH = userDetails['MaKH']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getBillById(maKH),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/images/nodata.jpg',
                ),
                const Text(
                  'Không có dữ liệu',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/images/nodata.jpg',
                ),
                const Text(
                  'Không có dữ liệu',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ));
          } else {
            final bookings = snapshot.data!;
            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                final date = booking['ThoiGianTT'];
                final double quantity = (booking['DatVe']['GiaTien'] / 70000);
                final String formattedQuantity =
                    NumberFormat('###.##').format(quantity);
                DateTime dateTime = DateTime.parse(date);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingDetail(booking: booking),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: Colors.grey[850],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            child: Image.network(
                              booking['DatVe']['Phim']['AnhPhim'],
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking['DatVe']['Phim']['TenPhim'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.local_activity,
                                          color: Colors.blue, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Số lượng: ${formattedQuantity}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          color: Colors.orange, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        DateFormat('dd/MM/yyyy')
                                            .format(dateTime),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.attach_money,
                                          color: Colors.green, size: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        NumberFormat('###,### VND').format(
                                            booking['DatVe']['GiaTien']),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_activity,
                                    color: Colors.white, size: 30),
                                const SizedBox(height: 8),
                                Text(
                                  formattedQuantity,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
