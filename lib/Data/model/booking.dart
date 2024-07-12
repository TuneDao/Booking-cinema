class MovieBooking {
  final int id;
  final String name;
  final String img;
  final String date;
  final int price;
  final String room;
  final String time;
  final String seats;
  final int quantity;

  MovieBooking({
    required this.id,
    required this.name,
    required this.img,
    required this.date,
    required this.price,
    required this.room,
    required this.time,
    required this.seats,
    required this.quantity,
  });

  factory MovieBooking.fromJson(Map<String, dynamic> json) {
    return MovieBooking(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      date: json['date'],
      price: json['price'],
      room: json['room'],
      time: json['time'],
      seats: json['seats'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'date': date,
      'price': price,
      'time': time,
      'room': room,
      'seats': seats,
      'quantity': quantity,
    };
  }
}
