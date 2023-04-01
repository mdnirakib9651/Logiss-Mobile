import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logiss_mobile/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/romote/dio/dio_client.dart';
import 'data/datasource/romote/dio/logging_interceptor.dart';
import 'helper/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.shopMaxBaseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  //---------->>> Repository <<<------------
  // sl.registerLazySingleton(() => SplashRepo(dioClient: sl(), sharedPreferences: sl()));

  //----------->>> Provider <<<-------------
  // sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}