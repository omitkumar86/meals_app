
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meals_app/data/repositories/recipes_view_repo.dart';
import 'package:meals_app/provider/recipes_view_provider.dart';
import 'package:meals_app/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';


final sl = GetIt.instance;

Future<void> init() async {

  /// Core
     sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
     sl.registerLazySingleton(() => RecipesViewRepo(dioClient: sl(), sharedPreferences: sl()));

  /// Provider
     sl.registerFactory(() => RecipesViewProvider(recipesViewRepo: sl()));

  /// External
      final sharedPreferences = await SharedPreferences.getInstance();
      sl.registerLazySingleton(() => sharedPreferences);
      sl.registerLazySingleton(() => Dio());
      sl.registerLazySingleton(() => LoggingInterceptor());

}