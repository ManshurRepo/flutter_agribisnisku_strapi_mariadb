import 'dart:convert';

class MarketingTargetResponseModel {
  final List<Marketing> data;
  final Meta meta;

  MarketingTargetResponseModel({
    required this.data,
    required this.meta,
  });

  factory MarketingTargetResponseModel.fromJson(String str) =>
      MarketingTargetResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MarketingTargetResponseModel.fromMap(Map<String, dynamic> json) =>
      MarketingTargetResponseModel(
        data: List<Marketing>.from(json["data"].map((x) => Marketing.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class Marketing {
  final int id;
  final Attributes attributes;

  Marketing({
    required this.id,
    required this.attributes,
  });

  factory Marketing.fromJson(String str) => Marketing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Marketing.fromMap(Map<String, dynamic> json) => Marketing(
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
