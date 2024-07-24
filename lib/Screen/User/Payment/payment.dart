
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Screen/User/Payment/payment_complete.dart';
import 'package:project_android/config/const.dart';

class PaymentScreen extends StatefulWidget {
  final Film_API film;
  final int totalPrice;

  const PaymentScreen({
    Key? key,
    required this.film,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? maKH;
  String? _selectedPaymentMethod = 'ATM card (Thẻ nội địa)';
  final List<Map<String, String>> paymentMethods = [
    {
      'title': 'ATM card (Thẻ nội địa)',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/MAC_%28Money_Access_Card%29_ATM_Card.jpg/640px-MAC_%28Money_Access_Card%29_ATM_Card.jpg',
    },
    {
      'title': 'Thẻ quốc tế (Visa, Master, Amex, JCB)',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Visa_Electron.png/640px-Visa_Electron.png',
    },
    {
      'title': 'MoMo: Nhập MM24 -5K, nhận thẻ 10k 4G/5G',
      'image': 'https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png',
    },
    {
      'title': 'ZaloPay - 84k/vé + gói quà ưu đãi 530k',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/ZaloPay-chuong.png/640px-ZaloPay-chuong.png',
    },
  ];

  final ApiService apiService = ApiService();

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

  Future<void> createOrderAndDetail() async {
    int maxIDDatVe = await fetchMaxIdDV();
    int maxIDHoaDon = await fetchMaxIdHoaDon();
    if (maKH == null) {
      _showErrorDialog('Failed to retrieve customer ID');
      return;
    }

    final Map<String, dynamic> detailData = {
      "MaDat": maxIDDatVe + 1,
      "MaPhim": widget.film.maPhim,
      "MaKH": maKH,
      "Ghe": "A1",
      "GiaTien": widget.totalPrice,
      "ThoiGianDat": DateTime.now().toIso8601String(),
    };

    final detailId = await apiService.createDetail(detailData);

    if (detailId != null) {
      final Map<String, dynamic> orderData = {
        "MaHD": maxIDHoaDon + 1,
        "MaKH": maKH,
        "MaDat": detailId,
        "SoLuong": (widget.totalPrice / 70000).toInt(),
        "ThoiGianTT": DateTime.now().toIso8601String(),
      };

      final bool orderCreated = await apiService.createOrder(orderData);

      if (orderCreated) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentComplete(
              film: widget.film,
              totalPrice: widget.totalPrice,
            ),
          ),
        );
      } else {
        _showErrorDialog('Failed to create order');
      }
    } else {
      _showErrorDialog('Failed to create order detail');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 5.0),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text('Thanh Toán', style: titleStyle),
        ),
      ),
      body: maKH == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.0,
                              height: 180.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(widget.film.anhPhim),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.film.tenPhim}',
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Xuất chiếu: ${widget.film.theLoai}',
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Text(
                                    'Giá vé: 70,000 VND',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          width: 500.0,
                          color: const Color.fromRGBO(255, 241, 219, 50),
                          padding: const EdgeInsets.all(15.0),
                          child: const Text(
                            'Thông tin vé',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        Container(
                          width: 500.0,
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 10.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.black),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Số lượng',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Text(
                                  '${(widget.totalPrice / 70000).toInt()}',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 1.0),
                        Container(
                          width: 500.0,
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tổng thành tiền',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  NumberFormat('###,### VND')
                                      .format(widget.totalPrice),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 500.0,
                          color: const Color.fromRGBO(255, 241, 219, 50),
                          padding: const EdgeInsets.all(15.0),
                          child: const Text(
                            'Chọn phương thức thanh toán',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...paymentMethods.map((method) {
                          return ListTile(
                            leading: Image.network(
                              method['image']!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(method['title']!),
                            trailing: Radio<String>(
                              value: method['title']!,
                              groupValue: _selectedPaymentMethod,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedPaymentMethod = value;
                                });
                              },
                            ),
                          );
                        }).toList(),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextButton(
                          onPressed: () {
                            createOrderAndDetail();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorTheme,
                          ),
                          child: const textButton(text: 'XÁC NHẬN')),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
