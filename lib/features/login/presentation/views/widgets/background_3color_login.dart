import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:task2/core/core_widgets/custom_button.dart';
import 'package:task2/core/core_widgets/custom_text_field.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/features/login/presentation/views/widgets/login_view_body.dart';


class BackgroundThreeColorsLogin extends StatelessWidget {
  const BackgroundThreeColorsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children:
      [
        Pinned.fromPins(
          Pin(size: width , start: -width*0.4),
          Pin(size: height*0.6, start: height*0.02),
          child: Container(
            decoration: const BoxDecoration(
              color:  Color(0xfffa68d9),
              borderRadius:
              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color:  Color(0xfffccccc),
            borderRadius: BorderRadius.all(Radius.elliptical(1500.0, 19999.0)),
          ),
          margin: EdgeInsets.fromLTRB(1, height*0.4, 1, 5.0),
        ),
        Pinned.fromPins(
          Pin(size: width*0.8, end: -width *0.1),
          Pin(size: height*0.9, start: -height*0.2),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffc9b5f8),
              borderRadius:
              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 0, end: 0),
          Pin(size: 10000.0, middle: 0.5),
          child: Transform.rotate(
            angle: 0.0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                    sigmaX: 50.0, sigmaY: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x66ffffff),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
