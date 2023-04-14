import 'package:adobe_xd/pinned.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task2/core/local_database/cache_helper.dart';
import 'package:task2/core/resources_manager/style_manager.dart';
import 'package:task2/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:task2/features/home/presentation/views/widgets/row_action_item.dart';
import 'package:task2/features/manager/app_cubit.dart';
import 'package:task2/features/manager/app_states.dart';

import '../../../../../core/local_database/cache_helper_keys.dart';
import '../../../../../core/resources_manager/delay_manager.dart';
import '../../../../login/presentation/views/login_view.dart';

class RowActions extends StatelessWidget {
  const RowActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          var width = MediaQuery.of(context).size.width;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                RowActionItem(
                  image: 'assets/Group 16.png',
                  text: 'log out',
                  color: Colors.red,
                  onTab: () async
                  {
                    AppCubit.get(context).userModel = null;
                    await CacheHelper.removeData(key: CacheHelperKeys.tokenKey).then((value)
                    {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (BuildContext context) => const LoginView()),
                              (route) {
                            return false;
                          });
                    });

                  },
                ),
                const Spacer(),
                RowActionItem(
                  image: 'assets/Group 14-1.png',
                  text: 'upload',
                  color: Colors.amber,
                  onTab: ()
                  {
                    AppCubit.get(context).showSelectView();
                  },
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
