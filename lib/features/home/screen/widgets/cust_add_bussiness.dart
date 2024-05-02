import 'package:flutter/material.dart';
import 'package:wormonks/features/home/controller/home_controller.dart';

class CusAddButton extends StatelessWidget {
  const CusAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red, width: 2)),
            child: InkWell(
              onTap: () => homeController.createBusiness(),
              child: const Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
