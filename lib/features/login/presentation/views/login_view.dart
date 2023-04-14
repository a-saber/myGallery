import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:task2/core/core_widgets/custom_button.dart';
import 'package:task2/core/core_widgets/custom_text_field.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {

  const LoginView({ Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor:  Color(0xffffffff),
      body: LoginViewBody(),
    );
  }
}










