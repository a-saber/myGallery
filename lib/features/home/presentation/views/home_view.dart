import 'package:adobe_xd/pinned.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xffddcdff),
      body: HomeViewBody(),
    );
  }
}





/*
   // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Row(
                    //     children:
                    //     [
                    //       Expanded(
                    //         child: Container(
                    //           height: 50,
                    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(20)
                    //           ),
                    //           child: Row(
                    //             children:
                    //             [
                    //               Expanded(
                    //                   child: Image.asset('assets/Group 16.png'),
                    //               ),
                    //               Expanded(child: Text('log out'))
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(width: 40,),
                    //       Expanded(
                    //         child: Container(
                    //           height: 50,
                    //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(20)
                    //           ),
                    //           child: Row(
                    //             children:
                    //             [
                    //               Expanded(child: Image.asset('assets/Group 14-1.png')),
                    //               Expanded(child: Text('upload'))
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
 */