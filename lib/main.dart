import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task2/core/local_database/cache_helper.dart';
import 'package:task2/core/local_database/cache_helper_keys.dart';
import 'package:task2/core/resources_manager/constants_manager.dart';
import 'package:task2/features/home/presentation/views/home_view.dart';
import 'package:task2/features/login/presentation/views/login_view.dart';
import 'package:task2/features/manager/app_cubit.dart';
import 'package:task2/features/manager/app_states.dart';

import 'core/api_services/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  ConstantManager.tokenValue = await CacheHelper.getData(key: CacheHelperKeys.tokenKey);

  if(ConstantManager.tokenValue != null){
    runApp( MyApp(startScreen: const HomeView()));
  }
  else{
    runApp( MyApp(startScreen: const LoginView()));
  }

}

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  MyApp({super.key, this.startScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getImages(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) => GetMaterialApp(
          theme: ThemeData(fontFamily: 'Baloo_Thambi_2'),
            title: 'My Gallery',
            debugShowCheckedModeBanner: false,
            home: startScreen
           // home: HomeView()
        ),
        listener: (context, state) {},
      ),
    );
  }

}
/*
Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Center(child: TextButton(onPressed: ()
              {
                DioHelper.login(
                  email : 'madelyn23@example.net',
                  password: 'password',
                ).then((value)
                {
                  userModel = UserModel.fromJson(value.data);
                  print(userModel!.token);
                  print(value.data.toString());

                }).catchError((error)
                {
                  print(error.toString());
                });
              }, child: const Text('login')),),
              Center(child: TextButton(onPressed: ()
              {
                DioHelper.getImages()
                    .then((value)
                {
                  print(value.data["data"]["images"][0].toString());
                  print(value.data["data"]["images"][1].toString());

                })
                    .catchError((error)
                {
                  print('error');
                  print(error.toString());

                });
              }, child: const Text('two')),
              ),

              SizedBox(height: 200,),
              Center(child: TextButton(onPressed: () async
              {
                await getProfileImage();
              }, child: const Text('upload')),
              ),
            ],
          ),
        ),
      )
 */