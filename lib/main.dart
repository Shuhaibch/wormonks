import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wormonks/bindings/general_bindings.dart';
import 'package:wormonks/features/authentication/screen/login_screen.dart';
import 'package:wormonks/utils/cust_text_form_feild.dart';

void main() {
  //* widget binding
  // final WidgetsBinding widgetsBinding =
  //     WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      title: 'Flutter Demo',
      
      theme: ThemeData(
      inputDecorationTheme: CTextFeildTheme.lightInputDecarationTheme, 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
