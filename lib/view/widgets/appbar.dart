import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.iconColor,
    required this.titleColor,
  }) : super(key: key);
  final Color iconColor;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: iconColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text(
            'Real 11',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 13, 93, 159),
            ),
          ),
        ),
      ],
    );
  }
}
