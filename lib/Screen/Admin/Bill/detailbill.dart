import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/config/const.dart';
import 'package:project_android/Data/API/api.dart';

class InvoiceDetailScreen extends StatefulWidget {
  final int invoiceId;

  InvoiceDetailScreen({required this.invoiceId});

  @override
  _InvoiceDetailScreenState createState() => _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends State<InvoiceDetailScreen> {
  Map<String, dynamic> invoice = {};

  @override
  void initState() {
    super.initState();
    _fetchInvoiceDetail();
  }

  Future<void> _fetchInvoiceDetail() async {
    try {
      Map<String, dynamic> data = await getBillDetailById(widget.invoiceId);
      setState(() {
        invoice = data;
      });
    } catch (error) {
      print('Failed to load invoice detail: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final date = invoice['ThoiGianTT'];
    DateTime? dateTime;
    if (date != null) {
      try {
        dateTime = DateTime.parse(date);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Text(
              'Quản lý hóa đơn',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: invoice.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // Center(
                //   child: Opacity(
                //     opacity: 0.1,
                //     child: Transform.rotate(
                //       angle: 45 * 3.1415927 / 180, // Xoay 45 độ
                //       child: Image.asset(
                //         'assets/images/logo2.png',
                //         errorBuilder: (context, error, stackTrace) =>
                //             const SizedBox.shrink(),
                //         width: 500, // Điều chỉnh kích thước lớn hơn
                //         height: 500, // Điều chỉnh kích thước lớn hơn
                //       ),
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'HÓA ĐƠN THANH TOÁN',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 390,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInvoiceRow(
                                  'Mã Hóa Đơn:', '${invoice['MaHD']}'),
                              _buildInvoiceRow('Tên Khách Hàng:',
                                  '${invoice['KhachHang']['HoTen']}'),
                              _buildInvoiceRow('Số Điện Thoại:',
                                  '${invoice['KhachHang']['STD']}'),
                              _buildInvoiceRow(
                                  'Thời Gian Thanh Toán:',
                                  dateTime != null
                                      ? '${DateFormat('dd/MM/yyyy').format(dateTime)}'
                                      : 'Không xác định'),
                              const Divider(thickness: 1),
                              const Text(
                                'Vé Đã Mua:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: (invoice['DatVe']['Phim']
                                        ['SuatChieux'] as List)
                                    .map<Widget>((showtime) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              invoice['DatVe']['Phim']
                                                  ['TenPhim'],
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          Text(
                                              'x${NumberFormat('###.##').format(invoice['DatVe']['GiaTien'] / 70000)}',
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Suất: ${showtime['NgayChieu']} ${showtime['ThoiGianBD']}',
                                              style: const TextStyle(
                                                  fontSize: 14)),
                                          Text(
                                              '${NumberFormat('###,### VND').format(invoice['DatVe']['GiaTien'])}',
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Divider(thickness: 1),
                                    ],
                                  );
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Tổng Cộng: ${NumberFormat('###,### VND').format(invoice['DatVe']['GiaTien'])}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text(
                            'Cảm ơn quý khách và hẹn gặp lại!',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildInvoiceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
