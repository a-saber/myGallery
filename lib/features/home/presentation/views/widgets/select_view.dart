import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/manager/app_cubit.dart';
import 'package:task2/features/manager/app_states.dart';

class SelectView extends StatelessWidget {
  const SelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state)
        {

          return  Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              children: [
                const SizedBox(height: 350,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  height: 250,
                  width: 300,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x66ffffff),
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(color: Colors.white)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70.0,vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                            [
                              InkWell(
                                onTap: ()
                                {
                                  AppCubit.get(context).upload(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffcdf4),
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: Row(
                                    children:
                                    [
                                      Image.asset('assets/gallery.png',fit: BoxFit.fill),
                                      SizedBox(width: 5,),
                                      Expanded(child: Text('Gellary',style: StyleManager.style20.copyWith(fontWeight: FontWeight.bold),))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              InkWell(
                                onTap: ()
                                {
                                  AppCubit.get(context).upload(ImageSource.camera);

                                },
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffe7fbfd),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                    children:
                                    [
                                      Image.asset('assets/3.png',fit: BoxFit.fill,),
                                      SizedBox(width: 5,),
                                      Expanded(child: Text('Camera',style: StyleManager.style20.copyWith(fontWeight: FontWeight.bold),))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
