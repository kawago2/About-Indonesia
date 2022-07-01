class Kelurahan {
  Kelurahan({
    this.kelurahan,
  });

  List<KelurahanElement>? kelurahan;

  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        kelurahan: List<KelurahanElement>.from(
            json["kelurahan"].map((x) => KelurahanElement.fromJson(x))),
      );
}

class KelurahanElement {
  KelurahanElement({
    this.id,
    this.idKecamatan,
    this.nama,
  });

  int? id;
  String? idKecamatan;
  String? nama;

  factory KelurahanElement.fromJson(Map<String, dynamic> json) =>
      KelurahanElement(
        id: json["id"],
        idKecamatan: json["id_kecamatan"],
        nama: json["nama"],
      );
}
