// 主页面的单个目录组件

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lx_food_menu/core/model/category.dart';
import 'package:lx_food_menu/ui/pages/meal/meal.dart';
import 'package:lx_food_menu/ui/shared/size_fit.dart';

class LXCategoryItem extends StatelessWidget {
  final LXCategoryModel category;

  LXCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    Color color = category.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(
            colors: [color.withOpacity(.5), color],
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      onTap: () {
        // 点击跳转到食物详情页
        Navigator.of(context)
            .pushNamed(LXMealScreen.routeName, arguments: category);
      },
    );
  }
}
