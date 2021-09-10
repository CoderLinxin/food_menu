// 食物的视图模型

import 'package:flutter/cupertino.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import 'package:lx_food_menu/core/services/meals_request.dart';
import './filter_view_model.dart';

class LXMealViewModel extends ChangeNotifier {
  late List<LXMealModel> _meals = [];

  LXFilterViewModel? _filterVM;

  // 保存依赖的Provider，方便靠其进行一些操作
  void updateFilter(LXFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  // 根据食物过滤条件对_meals进行筛选
  List<LXMealModel> get meals {
    return _meals.where((element) {
      if (_filterVM!.isGlutenFree && !element.isGlutenFree) return false;
      if (_filterVM!.isLactoseFree && !element.isLactoseFree) return false;
      if (_filterVM!.isVegan && !element.isVegan) return false;
      if (_filterVM!.isVegetarian && !element.isVegetarian) return false;
      return true;
    }).toList();
  }

  LXMealViewModel() {
    // 请求食物数据
    LXMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners(); // 调用此方法通知界面更新
    });
  }
}
