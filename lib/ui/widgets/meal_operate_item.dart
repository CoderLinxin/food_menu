// 食物操作UI

import 'package:flutter/material.dart';

import 'package:lx_food_menu/ui/shared/size_fit.dart';

class LXMealOperateItem extends StatelessWidget {
  // 左边图标
  final IconData iconData;

  // 颜色
  final Color? color;

  // 右边描述信息
  final String title;

  LXMealOperateItem({required this.iconData, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData, color: color ?? Colors.black),
        SizedBox(
          width: 5.px,
        ),
        Text(
          title,
          style: TextStyle(color: color ?? Colors.black),
        ),
      ],
    );
  }
}
