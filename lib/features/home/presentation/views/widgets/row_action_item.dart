import 'package:adobe_xd/pinned.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/home_view_body.dart';

class RowActionItem extends StatelessWidget {
  const RowActionItem(
      {Key? key, required this.image, required this.text,
        required this.color,required this.onTab})
      : super(key: key);

  final Color color;
  final String text;
  final String image;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTab,
      child: Container(
       // padding: const EdgeInsets.only(left: 10),
        height: 40,
        width: width*0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 7, top: 7, bottom: 7, right: 7),
              height: height*0.03,
              width: width>600? 30: width*0.07,
              decoration: BoxDecoration(
                  //color: color,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.transparent,
                        offset: Offset(0, 5)),
                    BoxShadow(
                        color: color.withOpacity(.5),
                        blurRadius: 7.0,
                        offset: const Offset(-5, 0)),
                    const BoxShadow(
                        color: Colors.transparent,
                        offset: Offset(5, 0))
                  ],
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill
                  )
              ),
            ),
            SizedBox(width: width>600?20:0,),
            Text(
              text,
              style: StyleManager.style16.copyWith(color: Colors.black.withOpacity(0.5),fontSize: width>600? 22 : width*0.040),
            ),

          ],
        ),
      ),
    );
  }
}
