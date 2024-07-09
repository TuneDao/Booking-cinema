import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/food.dart';
import 'package:project_android/Data/provider/foodprovider.dart';
import 'package:project_android/Screen/User/Food/combowidget.dart';
import 'package:project_android/Screen/User/Payment/payment.dart';
import 'package:project_android/config/const.dart';

class ComboList extends StatefulWidget {
  const ComboList({super.key});

  @override
  State<ComboList> createState() => _ComboListState();
}

class _ComboListState extends State<ComboList> {
  Future<List<Food>> loadFoodList() async {
    return await ReadDataFodd().loadDataFood();
  }

  Map<int, int> quantities = {};
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  void _addQuantity(int id, int price) {
    setState(() {
      quantities[id] = (quantities[id] ?? 0) + 1;
      totalPrice += price;
    });
  }

  void _removeQuantity(int id, int price) {
    setState(() {
      int currentQuantity = quantities[id] ?? 0;
      if (currentQuantity > 0) {
        quantities[id] = currentQuantity - 1;
        totalPrice -= price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: colorTheme,
        elevation: 0,
        title: const Text("Mua vé", style: titleStyle),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Food>>(
            future: loadFoodList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red)),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data available',
                      style: TextStyle(color: Colors.grey)),
                );
              } else {
                List<Food> foodList = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: foodList.map((foodItem) {
                      return ComboWidget(
                        combo: foodItem,
                        quantity: quantities[foodItem.id!] ?? 0,
                        onAdd: () =>
                            _addQuantity(foodItem.id!, foodItem.price!),
                        onRemove: () =>
                            _removeQuantity(foodItem.id!, foodItem.price!),
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomScreen(totalPrice: totalPrice),
          ),
        ],
      ),
    );
  }
}

class BottomScreen extends StatelessWidget {
  final int totalPrice;

  const BottomScreen({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [colorTheme, Colors.black],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              textWhite(text: 'Tổng tiền'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 8.0),
              textWhite(text: NumberFormat('###,### đ').format(totalPrice)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PaymentScreen()));
            },
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
