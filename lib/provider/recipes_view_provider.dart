import 'package:flutter/material.dart';
import 'package:meals_app/data/repositories/recipes_view_repo.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/response_model/recipes_model.dart';

class RecipesViewProvider with ChangeNotifier{
  final RecipesViewRepo recipesViewRepo;

  RecipesViewProvider({required this.recipesViewRepo});

  bool _isLoading=false;
  MealsModel? _mealsModel;

  MealsModel? get mealsModel => _mealsModel;

  String? _status;
  String? _message;
  List<Meals>? _mealsList;

  String? get status => _status;
  String? get message => _message;
  List<Meals>? get mealsList => _mealsList;
  bool get isLoading => _isLoading;

  Future<dynamic> getRecipesView( BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await recipesViewRepo.getRecipesView();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading = false;
      notifyListeners();

      _mealsModel = MealsModel.fromJson(apiResponse.response!.data);
      _mealsList = _mealsModel!.meals;

      notifyListeners();
    }
    else {
      _isLoading = false;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();

    return _mealsList;
  }


}