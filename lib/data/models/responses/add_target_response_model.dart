import 'dart:convert';

class AddTargetResponseModel {
  final Data data;

  AddTargetResponseModel({
    required this.data,
  });

  factory AddTargetResponseModel.fromJson(String str) =>
      AddTargetResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddTargetResponseModel.fromMap(
          Map<String, dynamic> json) =>
      AddTargetResponseModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final Attributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class Attributes {
  final String title;
  final String category;
  final int weight;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String description;

  Attributes({
    required this.title,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.description,
  });

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        category: json["category"],
        weight: json["weight"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "category": category,
        "weight": weight,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "description": description,
      };
}
