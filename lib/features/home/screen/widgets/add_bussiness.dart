import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wormonks/features/home/controller/home_controller.dart';
import 'package:wormonks/features/home/screen/widgets/cus_popup_bar.dart';

class AddBussiness extends StatelessWidget {
  const AddBussiness({
    super.key,
    required this.width,
    required this.index,
  });

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Obx(
              () {
                return CustPopMenu(
                    onPressed: () {
                      controller.selectCategory(
                        index,
                      );
                    },
                    width: width,
                    title: controller
                            .bussinessList[index].category!.catgName!.isEmpty
                        ? 'Select Category'
                        : controller.bussinessList[index].category!.catgName!,
                    index: index);
              },
            ),
            Obx(
              () {
                return CustPopMenu(
                    onPressed: () {
                      controller.selectedCategory.catgName!.isEmpty
                          ? null
                          : controller.getProduct(
                              controller.bussinessList[index].category ??
                                  controller.categoryList[0],
                              index);
                    },
                    width: width,
                    title: controller.bussinessList[index].product!.name.isEmpty
                        ? 'Select Product'
                        : controller.bussinessList[index].product!.name,
                    index: index);
              },
            ),
            Obx(
              () {
                return CustPopMenu(
                    onPressed: () {
                      controller.productList.isNotEmpty
                          ? controller.getBrand(
                              controller.bussinessList[index].product!, index)
                          : null;
                    },
                    width: width,
                    title: controller.bussinessList[index].brand!.brand.isEmpty
                        ? 'Select Brand'
                        : controller.bussinessList[index].brand!.brand,
                    index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
