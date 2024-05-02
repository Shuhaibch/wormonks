import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:wormonks/features/home/model/brand_model.dart';
import 'package:wormonks/features/home/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:wormonks/features/home/model/product_model.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  //* Get Categories
  Future getCategories() async {
    try {
      var responce = await http.get(
        Uri.parse('https://suncity.warmonks.com/api/category'),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final CategoryModel categoryResp =
            CategoryModel.fromJson(jsonDecode(responce.body));
        final List<CategoryListModel> categoryList = categoryResp.data;
        // print(user.message);
        log(categoryList.length.toString());
        return {"status": true, "data": categoryList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": true, "data": 'Error Occured'};
    }
  }

  //* Get product
  Future getProduct(int id) async {
    try {
      final body = {"id": id.toString()};
      var responce = await http.post(
          Uri.parse('https://suncity.warmonks.com/api/prdtcat'),
          body: body);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final ProductModel productResp =
            ProductModel.fromJson(jsonDecode(responce.body));
        final List<ProductListModel> productList = productResp.data;
        // print(user.message);
        log(productList.length.toString());
        return {"status": true, "data": productList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      print(e.toString());
      return {"status": false, "data": 'Error Occured'};
    }
  }

  //* Get Brand
  Future getBrand(String id) async {
    try {
      final body = {"id": id};
      var responce = await http.post(
          Uri.parse('https://suncity.warmonks.com/api/brdcat'),
          body: body);
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final BrandModel brandResp =
            BrandModel.fromJson(jsonDecode(responce.body));
        final List<BrandListModel> brandList = brandResp.data;
        // print(user.message);
        log(brandList.length.toString());
        return {"status": true, "data": brandList};
      } else {
        return {"status": false, "data": responce.body};
      }
    } catch (e) {
      return {"status": false, "data": 'Error Occured'};
    }
  }
}
