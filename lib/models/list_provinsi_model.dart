class ListProvinsi {
  ListProvinsi({
    this.provinsi,
  });

  List<Provinsi>? provinsi;

  factory ListProvinsi.fromJson(Map<String, dynamic> json) => ListProvinsi(
        provinsi: List<Provinsi>.from(
            json["provinsi"].map((x) => Provinsi.fromJson(x))),
      );
}

class Provinsi {
  Provinsi({
    this.id,
    this.nama,
  });

  int? id;
  String? nama;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        id: json["id"],
        nama: json["nama"],
      );
}
