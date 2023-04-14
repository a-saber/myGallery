// import 'package:bookly/core/api_services/dio_helper.dart';
// import 'package:bookly/features/home/data/repos/home_repo_implementation.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
//
// final getIt = GetIt.instance;
//
// void setup()
// {
//   getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
//   getIt.registerSingleton<HomeRepoImplementation>(
//       HomeRepoImplementation(getIt.get<ApiServices>())
//   );
// }