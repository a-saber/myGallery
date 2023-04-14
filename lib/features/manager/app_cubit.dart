import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2/core/api_services/dio_helper.dart';
import 'package:task2/core/local_database/cache_helper.dart';
import 'package:task2/core/local_database/cache_helper_keys.dart';
import 'package:task2/core/resources_manager/constants_manager.dart';
import 'package:task2/features/home/data/models/response_model.dart';

import '../login/data/models/user_model.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isShown = false;
  void showSelectView()
  {
    isShown = ! isShown;
    emit(ChangeShowSelectViewState());
  }
  Future<void> upload(ImageSource source) async {
    File? picked;
    final image = await ImagePicker().pickImage(source: source);
    emit(UploadLoadingState());
    if (image != null) {
        final imageTemporary = File(image.path);
        picked = imageTemporary;
        DioHelper.uploadFile(
                token: ConstantManager.tokenValue!,
                filePath: picked.path,
                name: Uri.file(picked.path).pathSegments.last)
            .then((value) async {
              showSelectView();

          await getImages();
          emit(UploadSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(UploadErrorState(error.toString()));

        });

    }
      else
      {
        //isShown = false;
        emit(NotPickedState());

      }
  }

  List<String> images = [];

  Future<void> getImages() async {
    if(ConstantManager.tokenValue != null) {
      emit(GetImagesLoadingState());
      DioHelper.getImages(ConstantManager.tokenValue!).then((value) {
        ResponseModel response = ResponseModel.fromJson(value.data);
        images = response.data!.images!;
        emit(GetImagesSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetImagesErrorState(error.toString()));
      });
    }
  }

  UserModel? userModel;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.login(email: email, password: password).then((value) async {
      userModel = UserModel.fromJson(value.data);
      ConstantManager.tokenValue = userModel!.token;
      await CacheHelper.saveData(
          key: CacheHelperKeys.tokenKey, value: userModel!.token
      );
      await getImages();
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
