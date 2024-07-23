class Film_API {
  int? maPhim;
  String tenPhim;
  String anhPhim;
  String theLoai;
  String moTa;
  String daoDien;
  String ngonNgu;
  List<Screening> suatChieux;

  Film_API({
    required this.maPhim,
    required this.tenPhim,
    required this.anhPhim,
    required this.theLoai,
    required this.moTa,
    required this.daoDien,
    required this.ngonNgu,
    required this.suatChieux,
  });

  factory Film_API.fromJson(Map<String, dynamic> json) {
    var list = json['SuatChieux'] as List;
    List<Screening> screeningList =
        list.map((i) => Screening.fromJson(i)).toList();
    return Film_API(
      maPhim: json['MaPhim'],
      tenPhim: json['TenPhim'].trim(),
      anhPhim: json['AnhPhim'],
      theLoai: json['TheLoai']['TenTL'].trim(),
      moTa: json['MoTa'] ?? '',
      daoDien: json['DaoDien'],
      ngonNgu: json['NGonNgu'] ?? 'Tiếng Anh',
      suatChieux: screeningList,
    );
  }
}

class Screening {
  int? maSC;
  int? maPhim;
  String thoiGianBD;
  String thoiGianKT;
  String ngayChieu;
  String rapChieu;

  Screening({
    required this.maSC,
    required this.maPhim,
    required this.thoiGianBD,
    required this.thoiGianKT,
    required this.ngayChieu,
    required this.rapChieu,
  });

  factory Screening.fromJson(Map<String, dynamic> json) {
    return Screening(
      maSC: json['MaSC'],
      maPhim: json['MaPhim'],
      thoiGianBD: json['ThoiGianBD'],
      thoiGianKT: json['ThoiGianKT'],
      ngayChieu: json['NgayChieu'],
      rapChieu: json['RapChieu'],
    );
  }
}
