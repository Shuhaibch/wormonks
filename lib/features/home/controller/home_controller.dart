import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wormonks/commen/loader/loader.dart';
import 'package:wormonks/data/repository/home_repository.dart';
import 'package:wormonks/features/home/model/brand_model.dart';
import 'package:wormonks/features/home/model/bussiness_model.dart';
import 'package:wormonks/features/home/model/category_model.dart';
import 'package:wormonks/features/home/model/product_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //* Variable
  final isLoading = false.obs;
  final homeRepository = Get.put(HomeRepository());
  List<CategoryListModel> categoryList = [];
  List<ProductListModel> productList = [];
  List<BrandListModel> brandList = [];
  RxList<BusinessModel> bussinessList = <BusinessModel>[].obs;
  Rx businessModel = BusinessModel.empty().obs;
  CategoryListModel selectedCategory = CategoryListModel.empty();

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      isLoading.value = true;
      final categoryResponce = await homeRepository.getCategories();
      if (categoryResponce['status'] == true) {
        categoryList.addAll(categoryResponce['data']);
        // categoryList.add(categorymodel);
        isLoading.value = false;
        log(categoryList.length.toString());
      } else {
        Get.snackbar(
          'Oh Snap!',
          categoryResponce['data'],
          isDismissible: true,
          shouldIconPulse: true,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade600,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Iconsax.warning_2,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> getProduct(CategoryListModel category, int listIndex) async {
    try {
      CustLoader.loader();
      final productResponce =
          await homeRepository.getProduct(selectedCategory.id);
      if (productResponce['status'] == true) {
        brandList.clear();
        productList.clear();
        bussinessList[listIndex].brand =
            BrandListModel(id: '', category: '', brand: '');

        productList.addAll(productResponce['data']);
        isLoading.value = false;
        Get.back();

        selectProduct(listIndex, category);
        log(categoryList.length.toString());
      } else {
        isLoading.value = false;
        Get.back();

        Get.snackbar(
          'Oh Snap!',
          productResponce['data'],
          isDismissible: true,
          shouldIconPulse: true,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade600,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Iconsax.warning_2,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> getBrand(ProductListModel product, int listIndex) async {
    try {
      CustLoader.loader();
      brandList.clear();

      final brandResponce = await homeRepository.getBrand(product.id);
      if (brandResponce['status'] == true) {
        brandList.clear();
        bussinessList[listIndex].brand =
            BrandListModel(id: '', category: '', brand: '');
        brandList.addAll(brandResponce['data']);
        // categoryList.add(categorymodel);
        isLoading.value = false;
        Get.back();

        selectBrand(listIndex);
        log(categoryList.length.toString());
      } else {
        isLoading.value = false;
        Get.back();

        Get.snackbar(
          'Oh Snap!',
          brandResponce['data'],
          isDismissible: true,
          shouldIconPulse: true,
          colorText: Colors.white,
          backgroundColor: Colors.red.shade600,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Iconsax.warning_2,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> createBusiness() async {
    bussinessList.add(BusinessModel.empty());
    selectedCategory = CategoryListModel.empty();
  }

  Future<void> removeBussiness() async {
    bussinessList.removeLast();
  }

  Future<void> selectCategory(
    int listIndex,
  ) async {
    // isLoading.value = true;
    Get.dialog(
      Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];
                return InkWell(
                    onTap: () {
                      bussinessList[listIndex] = BusinessModel.empty();
                      selectedCategory = category;
                      productList.clear();
                      brandList.clear();

                      businessModel.value = bussinessList[listIndex];
                      businessModel.value.category = category;
                      bussinessList[listIndex] = businessModel.value;
                      // businessModel = BusinessModel.empty();
                      log(listIndex.toString(), name: 'in');
                      // bussinessList[listIndex].copyWith(category: category);

                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        category.catgName!,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ));
              },
            ),
          )),
      barrierDismissible: false,
    );
  }

  Future<void> selectProduct(int listIndex, CategoryListModel category) async {
    // isLoading.value = true;
    // isLoading.value ? const CircularProgressIndicator() : null;
    // await getProduct(category);
    // isLoading.value = false;

    // await getCategories();
    Get.dialog(
      Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return InkWell(
                    onTap: () {
                      brandList.clear();
                      businessModel.value = bussinessList[listIndex];
                      businessModel.value.product = product;
                      bussinessList[listIndex] = businessModel.value;
                      // businessModel = BusinessModel.empty();
                      log(listIndex.toString(), name: 'in');
                      // bussinessList[listIndex].copyWith(category: category);

                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ));
              },
            ),
          )),
      barrierDismissible: false,
    );
  }

  //* select brand

  Future<void> selectBrand(int listIndex) async {
    // isLoading.value = true;
    // isLoading.value ? const CircularProgressIndicator() : null;
    // await getProduct(category);
    // isLoading.value = false;

    // await getCategories();
    Get.dialog(
      Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: brandList.length,
              itemBuilder: (context, index) {
                final brand = brandList[index];
                return InkWell(
                    onTap: () {
                      businessModel.value = bussinessList[listIndex];
                      businessModel.value.brand = brand;
                      bussinessList[listIndex] = businessModel.value;
                      // businessModel = BusinessModel.empty();
                      log(listIndex.toString(), name: 'in');
                      // bussinessList[listIndex].copyWith(category: category);

                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        brand.brand,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ));
              },
            ),
          )),
      barrierDismissible: false,
    );
  }
}
