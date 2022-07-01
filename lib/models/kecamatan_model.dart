class Kecamatan {
  Kecamatan({
    this.kecamatan,
  });

  List<KecamatanElement>? kecamatan;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        kecamatan: List<KecamatanElement>.from(
            json["kecamatan"].map((x) => KecamatanElement.fromJson(x))),
      );
}

class KecamatanElement {
  KecamatanElement({
    this.id,
    this.idKota,
    this.nama,
  });

  int? id;
  String? idKota;
  String? nama;

  factory KecamatanElement.fromJson(Map<String, dynamic> json) =>
      KecamatanElement(
        id: json["id"],
        idKota: json["id_kota"],
        nama: json["nama"],
      );
}
