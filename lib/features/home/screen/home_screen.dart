import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wormonks/commen/appbar/cus_appbar.dart';
import 'package:wormonks/commen/bottom_nav/cus_bottom_nav.dart';
import 'package:wormonks/features/home/controller/home_controller.dart';
import 'package:wormonks/features/home/screen/widgets/add_bussiness.dart';
import 'package:wormonks/features/home/screen/widgets/cust_add_bussiness.dart';
import 'package:wormonks/features/home/screen/widgets/cust_remove_btn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: const CAppbar(),
      bottomNavigationBar: const CustBottomNav(),
      body: Stack(
        children: [
          SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    //* Date And Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .44,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '9:30',
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                                child: const Icon(
                                  Iconsax.clock,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .44,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '04/05/2000',
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                                child: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Select Branch',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: const Icon(
                            CupertinoIcons.chevron_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'From Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Place',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Contact Number',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Reference Number',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Bussiness Type :',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: const Icon(
                            CupertinoIcons.chevron_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.bussinessList.length,
                        itemBuilder: (context, index) {
                          log(index.toString());
                          return AddBussiness(width: width, index: index);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    //* Cust Add Button
                    Obx(
                      () => Column(
                        children: [
                          controller.bussinessList.isEmpty
                              ? const CusAddButton()
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [CusAddButton(), CusRemoveButton()],
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Occupation',
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Source of Enquiry',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: const Icon(
                            CupertinoIcons.chevron_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Customer Budget',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'C/O of enquiry',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
