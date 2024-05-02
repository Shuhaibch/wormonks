import 'package:flutter/material.dart';

class CTextFeildTheme {
  CTextFeildTheme._();

  //? light TextForm Feild
  static InputDecorationTheme lightInputDecarationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints:  BoxConstraints.expand(height: 14 ,),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    fillColor: Colors.grey.shade200,
    filled: true,
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withOpacity(.8),
    ),
    border: const OutlineInputBorder().copyWith(
        // borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade200)),
    enabledBorder: const OutlineInputBorder().copyWith(
        // borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey.shade200)),
    focusedBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        14,
      ),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );
}
