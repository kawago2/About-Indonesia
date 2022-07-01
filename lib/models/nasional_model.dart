// To parse this JSON data, do
//
//     final nasional = nasionalFromJson(jsonString);

class Nasional {
  int? code;
  String? status;
  String? messages;
  int? total;
  List<Datum>? data;

  Nasional({
    this.code,
    this.status,
    this.messages,
    this.total,
    this.data,
  });

  factory Nasional.fromJson(Map<String, dynamic> json) => Nasional(
        code: json["code"],
        status: json["status"],
        messages: json["messages"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  String? title;
  String? link;
  String? contentSnippet;
  DateTime? isoDate;
  Images? image;
  Datum({
    this.title,
    this.link,
    this.contentSnippet,
    this.isoDate,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        link: json["link"],
        contentSnippet: json["contentSnippet"],
        isoDate: DateTime.parse(json["isoDate"]),
        image: Images.fromJson(json["image"]),
      );
}

class Images {
  String? small;
  String? large;

  Images({
    this.small,
    this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        large: json["large"],
      );
}
