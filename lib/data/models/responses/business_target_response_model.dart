import 'dart:convert';

class BusinessTargetResponseModel {
  final List<Business> data;
  final Meta meta;

  BusinessTargetResponseModel({
    required this.data,
    required this.meta,
  });

  factory BusinessTargetResponseModel.fromJson(String str) =>
      BusinessTargetResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessTargetResponseModel.fromMap(Map<String, dynamic> json) =>
      BusinessTargetResponseModel(
        data: List<Business>.from(json["data"].map((x) => Business.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class Business {
  final int id;
  final Attributes attributes;

  Business({
    required this.id,
    required this.attributes,
  });

  factory Business.fromJson(String str) => Business.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Business.fromMap(Map<String, dynamic> json) => Business(
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

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
