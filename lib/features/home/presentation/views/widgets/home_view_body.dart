

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/features/home/presentation/views/widgets/background_3_colors_home.dart';
import 'package:task2/features/home/presentation/views/widgets/home_view_font.dart';
import 'package:task2/features/home/presentation/views/widgets/select_view.dart';
import 'package:task2/features/manager/app_cubit.dart';
import 'package:task2/features/manager/app_states.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state)
        {
          if(state is UploadLoadingState)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          else {
            return SafeArea(
              child: Stack(
                children: [

                  const BackgroundThreeColorsHome(),

                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Vector.png',),opacity: 0.5 ,
                                  fit: BoxFit.fill)
                          ),
                        ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:  EdgeInsets.only(right: width* 0.06,top: height*0.007),
                      child: SizedBox(
                          height: height*0.1,
                          width: width*0.14,
                          child: Image.asset('assets/Ellipse 1641.png',)),
                    ),
                  ),

                        const HomeViewFront(),

                        AppCubit.get(context).isShown ?
                        const SelectView() : Container(),



                ],
              ),
            );
          }
        }, listener: (context, state)
        {

        });
  }
}
