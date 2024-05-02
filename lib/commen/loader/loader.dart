import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustLoader {
  static loader(){
    return Get.dialog(
        const Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: SizedBox(
            height: 80,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.red),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Loading',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}