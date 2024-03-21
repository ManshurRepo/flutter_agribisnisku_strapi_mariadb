import 'dart:convert';

class BusinessProfileResponseModel {
  final List<BusinessProfile> data;
  final Meta meta;

  BusinessProfileResponseModel({
    required this.data,
    required this.meta,
  });

  factory BusinessProfileResponseModel.fromJson(String str) =>
      BusinessProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      BusinessProfileResponseModel(
        data: List<BusinessProfile>.from(json["data"].map((x) => BusinessProfile.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class BusinessProfile {
  final int id;
  final DatumAttributes attributes;

  BusinessProfile({
    required this.id,
    required this.attributes,
  });

  factory BusinessProfile.fromJson(String str) => BusinessProfile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessProfile.fromMap(Map<String, dynamic> json) => BusinessProfile(
        id: json["id"],
        attributes: DatumAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class DatumAttributes {
  final String businessName;
  final String businessSectors;
  final String aboutUs;
  final String businessValue;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final BusinessLogo businessLogo;

  DatumAttributes({
    required this.businessName,
    required this.businessSectors,
    required this.aboutUs,
    required this.businessValue,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.businessLogo,
  });

  factory DatumAttributes.fromJson(String str) =>
      DatumAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumAttributes.fromMap(Map<String, dynamic> json) => DatumAttributes(
        businessName: json["business_name"],
        businessSectors: json["business_sectors"],
        aboutUs: json["about_us"],
        businessValue: json["business_value"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        businessLogo: BusinessLogo.fromMap(json["business_logo"]),
      );

  Map<String, dynamic> toMap() => {
        "business_name": businessName,
        "business_sectors": businessSectors,
        "about_us": aboutUs,
        "business_value": businessValue,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "business_logo": businessLogo.toMap(),
      };
}

class BusinessLogo {
  final Data data;

  BusinessLogo({
    required this.data,
  });

  factory BusinessLogo.fromJson(String str) =>
      BusinessLogo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessLogo.fromMap(Map<String, dynamic> json) => BusinessLogo(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final DataAttributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class DataAttributes {
  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final int width;
  final int height;
  final Formats formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  DataAttributes({
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataAttributes.fromJson(String str) =>
      DataAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAttributes.fromMap(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toMap(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Formats {
  final Large thumbnail;
  final Large small;
  final Large medium;
  final Large large;

  Formats({
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail: Large.fromMap(json["thumbnail"]),
        small: Large.fromMap(json["small"]),
        medium: Large.fromMap(json["medium"]),
        large: Large.fromMap(json["large"]),
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail.toMap(),
        "small": small.toMap(),
        "medium": medium.toMap(),
        "large": large.toMap(),
      };
}

class Large {
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final dynamic path;
  final int width;
  final int height;
  final double size;
  final String url;

  Large({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });

  factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
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
