class Kbbi {
  Kbbi({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum>? data;

  factory Kbbi.fromJson(Map<String, dynamic> json) => Kbbi(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.lema,
    required this.arti,
  });

  String lema;
  List<Arti>? arti;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        lema: json["lema"],
        arti: List<Arti>.from(json["arti"].map((x) => Arti.fromJson(x))),
      );
}

class Arti {
  Arti({
    required this.kelasKata,
    required this.deskripsi,
  });

  String kelasKata;
  String deskripsi;

  factory Arti.fromJson(Map<String, dynamic> json) => Arti(
        kelasKata: json["kelas_kata"],
        deskripsi: json["deskripsi"],
      );
}
