class Sekolah {
  Sekolah({
    this.creator,
    this.status,
    this.donate,
    this.dataSekolah,
    this.totalData,
    this.page,
    this.perPage,
  });

  String? creator;
  String? status;
  Donate? donate;
  List<DataSekolah>? dataSekolah;
  int? totalData;
  int? page;
  int? perPage;

  factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
        creator: json["creator"],
        status: json["status"],
        donate: Donate.fromJson(json["Donate"]),
        dataSekolah: List<DataSekolah>.from(
            json["dataSekolah"].map((x) => DataSekolah.fromJson(x))),
        totalData: json["total_data"],
        page: json["page"],
        perPage: json["per_page"],
      );
}

class DataSekolah {
  DataSekolah({
    this.kodeProp,
    this.propinsi,
    this.kodeKabKota,
    this.kabupatenKota,
    this.kodeKec,
    this.kecamatan,
    this.id,
    this.npsn,
    this.sekolah,
    this.bentuk,
    this.status,
    this.alamatJalan,
    this.lintang,
    this.bujur,
  });

  String? kodeProp;
  String? propinsi;
  String? kodeKabKota;
  String? kabupatenKota;
  String? kodeKec;
  String? kecamatan;
  String? id;
  String? npsn;
  String? sekolah;
  String? bentuk;
  String? status;
  String? alamatJalan;
  String? lintang;
  String? bujur;

  factory DataSekolah.fromJson(Map<String, dynamic> json) => DataSekolah(
        kodeProp: json["kode_prop"],
        propinsi: json["propinsi"],
        kodeKabKota: json["kode_kab_kota"],
        kabupatenKota: json["kabupaten_kota"],
        kodeKec: json["kode_kec"],
        kecamatan: json["kecamatan"],
        id: json["id"],
        npsn: json["npsn"],
        sekolah: json["sekolah"],
        bentuk: json["bentuk"],
        status: json["status"],
        alamatJalan: json["alamat_jalan"],
        lintang: json["lintang"],
        bujur: json["bujur"],
      );
}

class Donate {
  Donate({
    this.gopay,
  });

  String? gopay;

  factory Donate.fromJson(Map<String, dynamic> json) => Donate(
        gopay: json["Gopay"],
      );
}
