class Film {
  int? id;
  String? name;
  String? category;
  String? img;
  String? description;
  String? time;

  Film(
      {this.id,
      this.name,
      this.category,
      this.img,
      this.time,
      this.description});
  Film.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    category = json["category"];
    img = json["img"];
    time = json["time"];
    description = json["description"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["category"] = category;
    data["img"] = img;
    data["time"] = time;
    data["description"] = description;
    return data;
  }
}
// class Film {
//   String maPhim;
//   String tenPhim;
//   String anhPhim;
//   String theLoai;
//   String moTa;

//   Film({
//     required this.maPhim,
//     required this.tenPhim,
//     required this.anhPhim,
//     required this.theLoai,
//     required this.moTa,
//   });

//   factory Film.fromJson(Map<String, dynamic> json) {
//     return Film(
//       maPhim: json['MaPhim'].trim(),
//       tenPhim: json['TenPhim'].trim(),
//       anhPhim: json['AnhPhim'],
//       theLoai: json['TheLoai']['TenTL'].trim(),
//       moTa: json['MoTa'] ?? '',
//     );
//   }
// }
