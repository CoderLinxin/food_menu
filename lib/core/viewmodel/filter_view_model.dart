// 食物过滤的视图模型

import 'package:flutter/cupertino.dart';

class LXFilterViewModel extends ChangeNotifier {
  // 是否是无骨蛋白
  bool _isGlutenFree = false;

  // 是否不含乳糖
  bool _isVegan = false;

  // 是否是素食主义者
  bool _isVegetarian = false;

  // 是否是严格素食主义者
  bool _isLactoseFree = false;

  // ignore: unnecessary_getters_setters
  bool get isGlutenFree => _isGlutenFree;

  // ignore: unnecessary_getters_setters
  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  bool get isLactoseFree => _isLactoseFree;

  // ignore: unnecessary_getters_setters
  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  bool get isVegetarian => _isVegetarian;

  // ignore: unnecessary_getters_setters
  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  bool get isVegan => _isVegan;

  // ignore: unnecessary_getters_setters
  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}
