// 食物制作详情页主体部分

import 'package:flutter/material.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import 'package:lx_food_menu/ui/shared/size_fit.dart';

class LXDetailContent extends StatelessWidget {
  final LXMealModel _meal;

  LXDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    // 使用SingleChildScrollView + Column制作滚动效果
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // 食物图片
          buildMealImage(),

          // 制作材料
          buildMakeTitle(context, '制作材料'),
          buildMakeMaterial(context),

          // 制作步骤
          buildMakeTitle(context, '制作步骤'),
          buildMakeSep(context),
        ],
      ),
    );
  }

  // 食物图片Widget
  Widget buildMealImage() {
    return Container(
      width: double.infinity,
      height: 250.px,
      child: Image.network(
        _meal.imageUrl,

        // 图片加载失败时显示
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // 制作材料表Widget
  Widget buildMakeMaterial(context) {
    return buildMakeList(
      context: context,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.px,
                horizontal: 10.px,
              ),
              child: Text(
                _meal.ingredients[index],
              ),
            ),
          );
        },
      ),
    );
  }

  // 制作步骤表Widget
  Widget buildMakeSep(context) {
    return buildMakeList(
      context: context,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('#${index + 1}'),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: _meal.steps.length,
      ),
    );
  }

  // 展示制作标题
  Widget buildMakeTitle(context, title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // 封装一个列表框架，用于构建制作步骤列表和制作材料列表
  Widget buildMakeList({required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6.px),
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
