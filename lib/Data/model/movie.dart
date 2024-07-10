class MoviesModel {
  String? MaPhim;
  String? TenPhim;
  String? AnhPhim;
  String? TheLoai;
  String? MoTa;
  String? PhongChieu;

  MoviesModel(
      {required this.MaPhim,
      required this.TenPhim,
      required this.AnhPhim,
      required this.MoTa,
      required this.TheLoai,
      required this.PhongChieu});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        MaPhim: json["MaPhim"] ?? '',
        TenPhim: json["TenPhim"] ?? '',
        AnhPhim: json["AnhPhim"] ?? '',
        MoTa: json["MoTa"] ?? '',
        TheLoai: json["TheLoai"] ?? '',
        PhongChieu: json["PhongChieu"] ?? '',
      );
}
