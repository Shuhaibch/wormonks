
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustBottomNav extends StatelessWidget {
  const CustBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 249, 17, 0),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            // fit: FlexFit.loose,
            child: Center(
              child: Text(
                'Save and Proceed',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // fit: FlexFit.loose,
            child: Container(
              height: 60,
              color: const Color.fromARGB(255, 134, 28, 21),
              child: const Icon(
                Icons.person_outline,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // fit: FlexFit.loose,
            child: Container(
              height: 60,
              color: const Color.fromARGB(255, 249, 17, 0),
              child: const Icon(
                Iconsax.setting_2,
                size: 29,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // fit: FlexFit.loose,
            child: Container(
              height: 60,
              color: const Color.fromARGB(255, 134, 28, 21),
              child: const Icon(
                CupertinoIcons.back,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
