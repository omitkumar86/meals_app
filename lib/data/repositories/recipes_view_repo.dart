import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class RecipesViewRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  RecipesViewRepo({required this.dioClient, required this.sharedPreferences});

  /// For Get
  Future<ApiResponse> getRecipesView() async {
    try {
      Response response = await dioClient.get(AppConstants.recipeViewUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}