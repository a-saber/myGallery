import 'package:task2/core/resources_manager/colors_manager.dart';
import 'package:flutter/material.dart';

import '../resources_manager/style_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed

  }) : super(key: key);

  final String text;
  final Color textColor;
  final Color backgroundColor;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height*0.06,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          )
        ),
          child: Text(
              text,
            style: StyleManager.style18.copyWith(
              fontSize: height*0.02,
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
      ),
    );
  }
}
