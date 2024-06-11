class Film {
  int? id;
  String? name;
  String? category;
  String? img;

  Film({this.id, this.name, this.category, this.img});
  Film.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    category = json["category"];
    img = json["img"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["category"] = category;
    data["img"] = img;
    return data;
  }
}
