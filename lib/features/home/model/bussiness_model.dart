// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wormonks/features/home/model/brand_model.dart';
import 'package:wormonks/features/home/model/category_model.dart';
import 'package:wormonks/features/home/model/product_model.dart';

class BusinessModel {
  CategoryListModel? category;
  BrandListModel? brand;
  ProductListModel? product;
  BusinessModel({
    required this.category,
    required this.brand,
    required this.product,
  });

  BusinessModel copyWith({
    CategoryListModel? category,
    BrandListModel? brand,
    ProductListModel? product,
  }) {
    return BusinessModel(
      category: category ?? this.category,
      brand: brand ?? this.brand,
      product: product ?? this.product,
    );
  }

  //* Ceate Empty function
  static BusinessModel empty() => BusinessModel(
      category: CategoryListModel.empty(),
      brand: BrandListModel(id: '', category: '', brand: ''),
      product: ProductListModel(
          id: '', name: '', category: Category.ACCESSORIES, brand: Brand.KAFF));

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category!.toJson(),
      'brand': brand!.toJson(),
      'product': product!.toJson(),
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      category:
          CategoryListModel.fromJson(map['category'] as Map<String, dynamic>),
      brand: BrandListModel.fromJson(map['brand'] as Map<String, dynamic>),
      product:
          ProductListModel.fromJson(map['product'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) =>
      BusinessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ClassName(category: $category, brand: $brand, product: $product)';

  @override
  bool operator ==(covariant BusinessModel other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.brand == brand &&
        other.product == product;
  }

  @override
  int get hashCode => category.hashCode ^ brand.hashCode ^ product.hashCode;
}
