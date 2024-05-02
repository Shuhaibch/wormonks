import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wormonks/features/authentication/controllers/login_controller.dart';
import 'package:wormonks/utils/canvas/cus_canvas.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(
                  width,
                  (width * 0.5833333333333334)
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: CCustomPainter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 230),
                  const Text(
                    'Hey',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'RaleWay'),
                  ),
                  const Text(
                    'Login Now!',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'RaleWay'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //* Form
                  Form(
                    key: controller.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter username';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "Username",
                            suffixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.black,
                              size: 38,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => TextFormField(
                            obscureText: controller.isVisible.value,
                            controller: controller.password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () => controller.isVisible.value =
                                    !controller.isVisible.value,
                                icon: controller.isVisible.value
                                    ? const Icon(
                                        Iconsax.eye,
                                        size: 38,
                                      )
                                    : const Icon(
                                        Iconsax.eye_slash5,
                                        size: 38,
                                      ),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Forget Password? / Reset'),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
                            height: 60,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () => controller.loginUser(),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                    
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Login Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
