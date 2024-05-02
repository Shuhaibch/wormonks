import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wormonks/data/repository/login_repository.dart';
import 'package:wormonks/features/home/screen/home_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //* variable
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isVisible = false.obs;

  Future<void> loginUser() async {
    try {
      isLoading.value = true;
      //Form validate
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        isLoading.value = false;
        return;
      }
      final userCredential =
          await LoginRepository.instance.loginUser(email.text, password.text);
      if (userCredential['status'] == true) {
        Get.offAll(() => const HomeScreen());
        isLoading.value = false;
      } else {
        isLoading.value = false;

        Get.snackbar(
          'Oh Snap!',
          userCredential['data'],
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

      Get.snackbar(
        'Oh Snap!',
        e.toString(),
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
  }
}
