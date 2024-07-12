// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:project_android/Data/model/booking.dart';

// class BookingDetail extends StatelessWidget {
//   final MovieBooking booking;

//   const BookingDetail({super.key, required this.booking});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(booking.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset(
//                 'assets/images/${booking.img}',
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               booking.name,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(Icons.calendar_today, color: Colors.orange, size: 24),
//                 const SizedBox(width: 8),
//                 Text(
//                   booking.date,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(Icons.attach_money, color: Colors.green, size: 24),
//                 const SizedBox(width: 8),
//                 Text(
//                   NumberFormat('###,### VND').format(booking.price),
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Icon(Icons.local_activity, color: Colors.blue, size: 24),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Quantity: ${booking.quantity}',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/booking.dart';
import 'package:project_android/config/const.dart';

class BookingDetail extends StatelessWidget {
  final MovieBooking booking;

  const BookingDetail({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          booking.name,
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
            )),
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
                  child: Image.asset(
                    'assets/images/${booking.img}',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                booking.name,
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
                  const SizedBox(width: 8),
                  Text(
                    booking.date,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    NumberFormat('###,### VND').format(booking.price),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.local_activity, color: Colors.blue, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    'Quantity: ${booking.quantity}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.white),
              const SizedBox(height: 16),
              Text(
                'Booking Details',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'This is where you can add more details about the booking. '
                'You can describe the movie, show the time, seat number, and any other relevant information.',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
