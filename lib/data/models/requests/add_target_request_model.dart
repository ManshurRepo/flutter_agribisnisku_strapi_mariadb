import 'dart:convert';

class AddTargetRequestModel {
  final Data data;

  AddTargetRequestModel({
    required this.data,
  });

  factory AddTargetRequestModel.fromJson(String str) =>
      AddTargetRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddTargetRequestModel.fromMap(Map<String, dynamic> json) =>
      AddTargetRequestModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final String title;
  final String category;
  final int weight;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  Data({
    required this.title,
    required this.category,
    required this.weight,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        title: json["title"],
        category: json["category"],
        weight: json["weight"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
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
        "description": description,
      };
}
