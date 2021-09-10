// meal数据的请求

import 'package:lx_food_menu/core/model/meal.dart';
import './http_request.dart';

class LXMealRequest {
  static Future<List<LXMealModel>> getMealData() async {
    // 发送网络请求
    final result = await HttpRequest.request('/meal');

    // 解析json数据并塞入数据模型
    List<LXMealModel> meals = [];
    for (var meal in result['meal']) meals.add(LXMealModel.fromJson(meal));

    return meals;
  }
}
