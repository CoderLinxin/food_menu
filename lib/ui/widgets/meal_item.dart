// 单个食物详情页

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lx_food_menu/core/model/meal.dart';
import 'package:lx_food_menu/ui/pages/detail/detail.dart';
import 'package:lx_food_menu/ui/shared/size_fit.dart';
import 'package:lx_food_menu/core/viewmodel/favor_meal_view_model.dart';
import './meal_operate_item.dart';

class LXMealItem extends StatelessWidget {
  final LXMealModel _meal;

  LXMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.px),
          ),
          child: Column(
            children: <Widget>[
              // 顶部食物图片
              buildMealBasicInfo(context),

              // 底部食物收藏界面
              buildMealOperateInfo(),
            ],
          ),
        ),

        // 点击跳转到食物制作详情页
        onTap: () {
          Navigator.of(context).pushNamed(LXDetail.routeName, arguments: _meal);
        },
      ),
    );
  }

  // 顶部食物图片等基础信息
  Widget buildMealBasicInfo(context) {
    return Stack(
      children: <Widget>[
        // 食物图片
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.px),
            topRight: Radius.circular(15.px),
          ),
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,

            // 图片加载失败时显示
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Container(
                  width: double.infinity,
                  height: 250.px,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),

        // 食物标题
        Positioned(
          bottom: 10.px,
          right: 10.px,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.px,
              horizontal: 10.px,
            ),
            width: 300.px,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(5.px),
            ),
            child: Text(
              _meal.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  // 底部食物收藏界面
  Widget buildMealOperateInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LXMealOperateItem(
            iconData: Icons.schedule,
            title: '${_meal.duration}分钟',
          ),
          LXMealOperateItem(
            iconData: Icons.restaurant,
            title: '${_meal.complexStr}',
          ),
          toggleFavorWidget(),
        ],
      ),
    );
  }

  // 切换收藏食物Widget的封装
  Widget toggleFavorWidget() {
    return Consumer<LXFavorMealViewModel>(
      builder: (context, favorMealVM, child) {
        final iconData =
            favorMealVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final color = favorMealVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorMealVM.isFavor(_meal) ? '已收藏' : '未收藏';

        return GestureDetector(
          child: LXMealOperateItem(
            iconData: iconData,
            title: title,
            color: color,
          ),
          // 点击切换食物收藏
          onTap: () => favorMealVM.toggleMealFavor(_meal),
        );
      },
    );
  }
}
