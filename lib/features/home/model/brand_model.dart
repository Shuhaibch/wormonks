
import 'dart:convert';

class BrandModel {
    final bool success;
    final String message;
    final List<BrandListModel> data;

    BrandModel({
        required this.success,
        required this.message,
        required this.data,
    });

    BrandModel copyWith({
        bool? success,
        String? message,
        List<BrandListModel>? data,
    }) => 
        BrandModel(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory BrandModel.fromRawJson(String str) => BrandModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        success: json["success"],
        message: json["message"],
        data: List<BrandListModel>.from(json["data"].map((x) => BrandListModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BrandListModel {
    final String id;
    final String category;
    final String brand;

    BrandListModel({
        required this.id,
        required this.category,
        required this.brand,
    });

    BrandListModel copyWith({
        String? id,
        String? category,
        String? brand,
    }) => 
        BrandListModel(
            id: id ?? this.id,
            category: category ?? this.category,
            brand: brand ?? this.brand,
        );

    factory BrandListModel.fromRawJson(String str) => BrandListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BrandListModel.fromJson(Map<String, dynamic> json) => BrandListModel(
        id: json["id"],
        category: json["category"],
        brand: json["Brand"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "Brand": brand,
    };
}
