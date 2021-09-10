// 食物列表（主体部分）

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lx_food_menu/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import 'package:lx_food_menu/core/model/category.dart';
import 'package:lx_food_menu/core/model/meal.dart';
import 'package:lx_food_menu/core/viewmodel/meal_view_model.dart';

class LXMealContent extends StatelessWidget {
  final LXCategoryModel category;

  LXMealContent(this.category);

  @override
  Widget build(BuildContext context) {
    return Selector<LXMealViewModel, List<LXMealModel>>(
        // 过滤不符合条件的菜单(where相当于filter函数)，查看所有meal中的categories是否包含当前的category的id
        selector: (context, mealVM) => mealVM.meals
            .where((element) => element.categories.contains(category.id))
            .toList(),
        builder: (context, meals, child) {
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return LXMealItem(meals[index]);
            },
          );
        },
        // 当菜单发生改变时才重新build
        shouldRebuild: (prev, next) => !ListEquality().equals(prev, next));
  }
}
