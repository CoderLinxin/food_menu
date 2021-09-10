// 食物列表页面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lx_food_menu/core/model/category.dart';
import './meal_content.dart';

class LXMealScreen extends StatelessWidget {
  static final String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    // 获取路由传递的参数
    final category =
        ModalRoute.of(context)?.settings.arguments as LXCategoryModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: LXMealContent(category),
    );
  }
}
