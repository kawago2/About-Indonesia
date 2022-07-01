class Quake {
  String tanggal;
  String jam;
  DateTime datetime;
  String coordinates;
  String lintang;
  String bujur;
  String magnitude;
  String kedalaman;
  String wilayah;
  String potensi;
  String dirasakan;
  String shakemap;

  Quake({
    required this.tanggal,
    required this.jam,
    required this.datetime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakemap,
  });

  factory Quake.fromJson(Map<String, dynamic> json) {
    return Quake(
      tanggal: json["Tanggal"],
      jam: json["Jam"],
      datetime: DateTime.parse(json["DateTime"]),
      coordinates: json["Coordinates"],
      lintang: json["Lintang"],
      bujur: json["Bujur"],
      magnitude: json["Magnitude"],
      kedalaman: json["Kedalaman"],
      wilayah: json["Wilayah"],
      potensi: json["Potensi"],
      dirasakan: json["Dirasakan"],
      shakemap: json["Shakemap"],
    );
  }
}
