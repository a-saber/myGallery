import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:task2/core/core_widgets/custom_button.dart';
import 'package:task2/core/core_widgets/custom_text_field.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/features/login/presentation/views/widgets/login_view_body.dart';

class UpperLines extends StatelessWidget {
  const UpperLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children:
      [
        Pinned.fromPins(
          Pin(size: width*0.8, start: -width*0.15),
          Pin(size: height*0.6, start: -height*0.3),
          child: Image.asset(
            'assets/login_upper_left.png',
          ),),

        Pinned.fromPins(
            Pin(size: width*0.35, start: width*0.12),
            Pin(size: height*0.15, start: height*0.05),
            child: Image.asset(
              'assets/login_cam.png',
            )
        ),
      ],
    );
  }
}
