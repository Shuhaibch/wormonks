// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustPopMenu extends StatelessWidget {
  const CustPopMenu({
    super.key,
    required this.title,
    required this.width,
    this.onPressed, required this.index,
  });
  final String title;
  final double width;
  final VoidCallback? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width * .84,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title),
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: const Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
