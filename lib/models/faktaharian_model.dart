class FaktaHarian {
  FaktaHarian({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory FaktaHarian.fromJson(Map<String, dynamic> json) => FaktaHarian(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.id,
    this.tahukahAnda,
  });

  int? id;
  String? tahukahAnda;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tahukahAnda: json["tahukahAnda"],
      );
}
