import 'dart:convert';
List<Brand> getBrandsFromJson(List<dynamic> data) => List<Brand>.from(data.map((x) => Brand.fromJson(x)));

String brandsToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  Brand({
    this.id,
    this.userId,
    this.name,
    this.type,
    this.deletedAt,
    this.createdAt,
    this.updatedAt
  });

  int? id;
  int? userId;
  String? name;
  String? type;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;


  factory Brand.fromJson(Map<dynamic, dynamic> json) {
    return Brand(
      id: json["id"],
      userId: json["user_id"],
      name: json["name"],
      type: json["type"],
      deletedAt: json["deleted_at"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id ,
    "user_id": userId ??'',
    "name": name ??'',
    "type": type ??'',
    "deleted_at": deletedAt ??'',
    "created_at": createdAt ??'',
    "updated_at": updatedAt ??'',
  };
}
