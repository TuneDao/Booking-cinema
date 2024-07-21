class Category {
  final String maTL;
  final String tenTL;

  Category({required this.maTL, required this.tenTL});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      maTL: json['MaTL'].trim(),
      tenTL: json['TenTL'],
    );
  }
}
