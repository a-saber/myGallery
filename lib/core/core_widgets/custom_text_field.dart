
import 'package:task2/core/resources_manager/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({
    required this.label,
    this.icon,
    required this.controller,
    required this.type,
    this.suffix,
    this.suffixPressed,
    this.cursorColor,
    this.cursorRadius,
    this.iconColor,
    this.labelColor,
    this.isPassword = false,
    this.onChange,
    this.onSubmit,
  });

  final String label;
  final IconData? icon;
  TextEditingController controller;
  final TextInputType type;
  IconData? suffix;
  Function()? suffixPressed;
  Color? cursorColor;
  Radius? cursorRadius;
  Color? iconColor;
  Color? labelColor;
  Function(String)? onSubmit;
  Function(String)? onChange;
  bool isPassword ;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30.0)
      ),
      //width: 00,
      //padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style:  Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: (String? value){if(value.toString().isEmpty||value==null)
          return "Mustn't Be Empty" ;
        return null;},
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all( 15),
           border: InputBorder.none,
          hintText: label,
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
          focusColor: ColorsManager.primaryColor,


        ),

        cursorColor: cursorColor,
        cursorRadius: cursorRadius,
      ),
    );
  }


}
