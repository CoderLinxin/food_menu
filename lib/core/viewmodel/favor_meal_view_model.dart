// 收藏的食物列表的视图模型

import 'package:flutter/cupertino.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import './filter_view_model.dart';

class LXFavorMealViewModel extends ChangeNotifier {
  final List<LXMealModel> _favorMeals = [];

  LXFilterViewModel? _filterVM;

  // 保存依赖的Provider，方便靠其进行一些操作
  void updateFilter(LXFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<LXMealModel> get favorMeals {
    return _favorMeals.where((element) {
      if (_filterVM!.isGlutenFree && !element.isGlutenFree) return false;
      if (_filterVM!.isLactoseFree && !element.isLactoseFree) return false;
      if (_filterVM!.isVegan && !element.isVegan) return false;
      if (_filterVM!.isVegetarian && !element.isVegetarian) return false;
      return true;
    }).toList();
  }

  // 收藏食物
  void addMeal(LXMealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  // 移除收藏
  void removeMeal(LXMealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  // 食物是否已经收藏?
  bool isFavor(LXMealModel meal) => _favorMeals.contains(meal);

  // 切换食物收藏
  void toggleMealFavor(LXMealModel meal) {
    if (isFavor(meal))
      removeMeal(meal);
    else
      addMeal(meal);
  }
}
