class KotaKabupaten {
  KotaKabupaten({
    this.kotaKabupaten,
  });

  List<KotaKabupatenElement>? kotaKabupaten;

  factory KotaKabupaten.fromJson(Map<String, dynamic> json) => KotaKabupaten(
        kotaKabupaten: List<KotaKabupatenElement>.from(json["kota_kabupaten"]
            .map((x) => KotaKabupatenElement.fromJson(x))),
      );
}

class KotaKabupatenElement {
  KotaKabupatenElement({
    this.id,
    this.idProvinsi,
    this.nama,
  });

  int? id;
  String? idProvinsi;
  String? nama;

  factory KotaKabupatenElement.fromJson(Map<String, dynamic> json) =>
      KotaKabupatenElement(
        id: json["id"],
        idProvinsi: json["id_provinsi"],
        nama: json["nama"],
      );
}
