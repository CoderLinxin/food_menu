// 食物制作详情页

import 'package:flutter/material.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import './detail_content.dart';
import './floating_button_widget.dart';

class LXDetail extends StatelessWidget {
  static final String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    LXMealModel meal =
    ModalRoute
        .of(context)!
        .settings
        .arguments as LXMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: LXDetailContent(meal),
      floatingActionButton:LXFloatButton(meal),
    );
  }
}
