class Category {
  final int? maTL;
  final String tenTL;

  Category({required this.maTL, required this.tenTL});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      maTL: json['MaTL'],
      tenTL: json['TenTL'],
    );
  }
}
