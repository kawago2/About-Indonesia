// To parse this JSON data, do
//
//     final pahlawan = pahlawanFromJson(jsonString);

import 'dart:convert';

List<Pahlawan> pahlawanFromJson(String str) => List<Pahlawan>.from(json.decode(str).map((x) => Pahlawan.fromJson(x)));

String pahlawanToJson(List<Pahlawan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pahlawan {
    Pahlawan({
        this.name,
        this.birthYear,
        this.deathYear,
        this.description,
        this.ascensionYear,
    });

    String? name;
    int? birthYear;
    int? deathYear;
    String? description;
    int? ascensionYear;

    factory Pahlawan.fromJson(Map<String, dynamic> json) => Pahlawan(
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
        description: json["description"],
        ascensionYear: json["ascension_year"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
        "description": description,
        "ascension_year": ascensionYear,
    };
}
