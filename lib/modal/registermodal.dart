// To parse this JSON data, do
//
//     final registerData = registerDataFromJson(jsonString);

import 'dart:convert';

RegisterData registerDataFromJson(String str) => RegisterData.fromJson(json.decode(str));

String registerDataToJson(RegisterData data) => json.encode(data.toJson());

class RegisterData {
  RegisterData({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;
  Support? support;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support?.toJson(),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    color: json["color"],
    pantoneValue: json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "color": color,
    "pantone_value": pantoneValue,
  };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
