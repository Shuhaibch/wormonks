import 'dart:convert';

class CategoryModel {
  final bool success;
  final String message;
  final List<CategoryListModel> data;

  CategoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  CategoryModel copyWith({
    bool? success,
    String? message,
    List<CategoryListModel>? data,
  }) =>
      CategoryModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        success: json["success"],
        message: json["message"],
        data: List<CategoryListModel>.from(
            json["data"].map((x) => CategoryListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryListModel {
  final int id;
  final String? catgName;
  final String active;

  CategoryListModel({
    required this.id,
    required this.catgName,
    required this.active,
  });

  CategoryListModel copyWith({
    int? id,
    String? catgName,
    String? active,
  }) =>
      CategoryListModel(
        id: id ?? this.id,
        catgName: catgName ?? this.catgName,
        active: active ?? this.active,
      );

  factory CategoryListModel.fromRawJson(String str) =>
      CategoryListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        id: json["id"],
        catgName: json["catg_name"],
        active: json["active"],
      );
  //* Ceate Empty function
  static CategoryListModel empty() =>
      CategoryListModel(id: 0, catgName: '', active: '');
  Map<String, dynamic> toJson() => {
        "id": id,
        "catg_name": catgName,
        "active": active,
      };
}
