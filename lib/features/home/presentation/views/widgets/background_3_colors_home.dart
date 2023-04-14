import 'package:adobe_xd/pinned.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/home_view_body.dart';



class BackgroundThreeColorsHome extends StatelessWidget {
  const BackgroundThreeColorsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children:
      [
        Pinned.fromPins(
          Pin(size: width , start: -width*0.2),
          Pin(size: height*0.6, start: height*0.08),
          child: Container(
            decoration: const BoxDecoration(
              color:  Color(0xffddcdff),
              borderRadius:
              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),

        Pinned.fromPins(
          Pin(size: width , start: -width*0.5),
          Pin(size: height*0.6, start: height*0.2),
          child: Container(
            decoration: const BoxDecoration(
              color:  Color(0xffea94d7),
              borderRadius:
              BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color:  Color(0xffffdada),
            borderRadius: BorderRadius.all(Radius.elliptical(1500.0, 19999.0)),
          ),
          margin: EdgeInsets.fromLTRB(1, height*0.6, 1, 5.0),
        ),

        Pinned.fromPins(
          Pin(size: width*0.92, end: -width *0.2),
          Pin(size: height*0.85, start: -height*0.2),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffddcdff),
              borderRadius:
              BorderRadius.all(Radius.elliptical(5999.0, 9999.0)),
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

        Pinned.fromPins(
          Pin(start: -1.0, end: 1.0),
          Pin(size: 414.0, end: 0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [const Color(0x00ffffff), const Color(0xffffffff)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
