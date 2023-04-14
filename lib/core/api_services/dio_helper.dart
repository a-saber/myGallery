import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:task2/main.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: "https://technichal.prominaagency.com/api/",
            receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> login({ required String email, required String password}) async {
    FormData formData =
    FormData.fromMap({
      "email": email,
      "password" : password
    });

    Response response = await dio.post(
        'https://technichal.prominaagency.com/api/auth/login',
        data: formData
    );
    return response;
  }

  static Future<Response> getImages(String token) async
  {

    Response response = await dio.get(
        'https://technichal.prominaagency.com/api/my-gallery',
        options: Options(
            headers: <String, String>{
              'Authorization': 'Bearer $token',
            }
        )
    );
    return response;
  }

    static Future<dynamic> uploadFile({ required String token ,required filePath, required String name}) async {
     FormData formData =
       FormData.fromMap({
        "img":
        await MultipartFile.fromFile(filePath, filename: name)});

      Response response = await dio.post(
          'https://technichal.prominaagency.com/api/upload',
          data: formData,
          options: Options(
              headers: <String, String>{
                'Authorization': 'Bearer $token',
              }
          )
      ).then((value) {
        print('suc');
        print(value.data.toString());
        return value;
      }).catchError((error){
        print('err');
        print(error.toString());
        return error;
      });
      return response;
  }


}

// File? image;
//
// Future<void> getProfileImage() async
// {
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   if( result != null){
//     image = File( result.files.single.path ?? "");
//     String fileName = image!.path.split('/').last;
//     await DioHelper.uploadFile(
//         filePath:  image!.path,
//         name: fileName
//     ).then((value)
//     {
//       print(value.toString());
//     }).catchError((error){
//       print('error');
//       print(error.toString());
//     });
//   }
//
//
//   // final pickedFile = await picker.pickImage(
//   //     source: ImageSource.gallery
//   // );
//   // if (pickedFile != null) {
//   //   print('yyy');
//   //   profileImage = File(pickedFile.path);
//   //   print(profileImage!.path.toString());
//   //   DioHelper.uploadFile(profileImage).then((value)
//   //   {
//   //     print('++');
//   //     //print(value.toString());
//   //   }).catchError((error)
//   //   {
//   //     print('object');
//   //     print(error.toString());
//   //   });
//   // }
//   // else {
//   //   print("no image selected");
//   // }
// }