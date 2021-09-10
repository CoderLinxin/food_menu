// 食物收藏页主体部分

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lx_food_menu/core/viewmodel/favor_meal_view_model.dart';
import 'package:lx_food_menu/ui/widgets/meal_item.dart';

class LXFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LXFavorMealViewModel>(
      builder: (context, favorMealVM, child) {
        if (favorMealVM.favorMeals.length == 0) {
          return Center(
            child: Text(
              '暂未收藏任何食物~',
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        }

        return ListView.builder(
          itemCount: favorMealVM.favorMeals.length,
          itemBuilder: (itemContext, index) {
            return LXMealItem(favorMealVM.favorMeals[index]);
          },
        );
      },
    );
  }
}
