// 切换收藏食物按钮Widget的定义

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import 'package:lx_food_menu/core/viewmodel/favor_meal_view_model.dart';

class LXFloatButton extends StatelessWidget {
  final LXMealModel _meal;

  LXFloatButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<LXFavorMealViewModel>(
      builder: (context, favorMealVM, child) {
        final icon =
            favorMealVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor =
            favorMealVM.isFavor(_meal) ? Colors.red : Colors.black;

        return FloatingActionButton(
            child: Icon(
              icon,
              color: iconColor,
            ),
            onPressed: () {
              // 点击切换食物收藏
              favorMealVM.toggleMealFavor(_meal);
            });
      },
    );
  }
}
