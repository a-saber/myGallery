import 'package:flutter/material.dart';
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/grid_images.dart';
import 'package:task2/features/home/presentation/views/widgets/row_actions.dart';

class HomeViewFront extends StatelessWidget {
  const HomeViewFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome\nMina',
              style: StyleManager.style30.copyWith(
                  fontFamily: 'Segoe UI',
                  color: const Color(0xff4a4a4a),
                  fontWeight: FontWeight.normal,
                  fontSize: height*0.04),),
            const SizedBox(height: 25),
            const RowActions(),
            const SizedBox(height: 30),
            const GridImages()
          ],
        ),
      ),
    );
  }
}
