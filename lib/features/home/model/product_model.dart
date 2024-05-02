
import 'dart:convert';

class ProductModel {
  final bool success;
  final String message;
  final List<ProductListModel> data;

  ProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  ProductModel copyWith({
    bool? success,
    String? message,
    List<ProductListModel>? data,
  }) =>
      ProductModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        message: json["message"],
        data: List<ProductListModel>.from(
            json["data"].map((x) => ProductListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductListModel {
  final String id;
  final String name;
  final Category category;
  final Brand brand;

  ProductListModel({
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
  });

  ProductListModel copyWith({
    String? id,
    String? name,
    Category? category,
    Brand? brand,
  }) =>
      ProductListModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        brand: brand ?? this.brand,
      );

  factory ProductListModel.fromRawJson(String str) =>
      ProductListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        id: json["id"],
        name: json["Name"],
        category: categoryValues.map[json["category"]] ?? Category.ACCESSORIES,
        brand: brandValues.map[json["Brand"]] ?? Brand.KAFF,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "category": categoryValues.reverse[category],
        "Brand": brandValues.reverse[brand],
      };
}

enum Brand { KAFF, SLEEK, SPITZE }

final brandValues = EnumValues(
    {"Kaff": Brand.KAFF, "Sleek": Brand.SLEEK, "Spitze": Brand.SPITZE});

enum Category { ACCESSORIES }

final categoryValues = EnumValues({"Accessories": Category.ACCESSORIES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
