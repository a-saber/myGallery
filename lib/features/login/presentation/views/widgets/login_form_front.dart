import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/features/manager/app_states.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';

import '../../../../../core/core_widgets/custom_button.dart';
import '../../../../../core/core_widgets/custom_text_field.dart';
import '../../../../../core/resources_manager/delay_manager.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../../manager/app_cubit.dart';

class LoginFormFront extends StatelessWidget {
  LoginFormFront({Key? key}) : super(key: key);
  var userName = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) => SizedBox(
        height: height * 0.45,
        child: ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0x66ffffff),
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Padding(
                padding:
                     EdgeInsets.symmetric(
                         horizontal: width *0.09, vertical: height*0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LOG IN',
                      style: TextStyle(
                        //fontFamily: 'Segoe UI',
                        fontSize: height *0.04,
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w700,
                        height: 0.5333333333333333,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height*0.06,
                      child: CustomTextField(
                          label: 'User Name',
                          controller: userName,
                          type: TextInputType.emailAddress),
                    ),
                    SizedBox(
                      height: height*0.06,
                      child: CustomTextField(
                          label: 'Password',
                          controller: password,
                          type: TextInputType.text),
                    ),
                    state is LoginLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blueAccent,
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                                text: 'SUBMIT',
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () {
                                  AppCubit.get(context).login(
                                      email: userName.text,
                                      password: password.text);
                                })),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (context, state) => {
        if (state is LoginSuccessState)
          {
            Get.to(() => const HomeView())
          }
      },
    );
  }
}
