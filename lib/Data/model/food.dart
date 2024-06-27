class Food {
  int? id;
  String? name;
  int? price;
  String? img;
  String? info;

  Food({this.id, this.name, this.price, this.img, this.info});
  Food.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    img = json["img"];
    info = json["info"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["img"] = img;
    data["info"] = info;
    return data;
  }
}
