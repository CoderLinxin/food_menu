// 统一配置路由

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/pages/meal/meal.dart';
import 'package:lx_food_menu/ui/pages/main/main.dart';
import 'package:lx_food_menu/ui/pages/detail/detail.dart';
import 'package:lx_food_menu/ui/pages/filter/filter.dart';

class LXRouter {
  // 设置默认路由
  static final String initialRoute = LXMainScreen.routeName;

  // 设置路由映射表
  static final Map<String, WidgetBuilder> routes = {
    LXMainScreen.routeName: (context) => LXMainScreen(), // 主界面
    LXMealScreen.routeName: (context) => LXMealScreen(), // 食物列表界面
    LXDetail.routeName: (context) => LXDetail(), // 食物制作详情页
  };

  // 设置路由工厂（可以进行条件判断给路由映射的Widget的构造函数传参，还可以进行一些路由的自定义设置）
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == LXFilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return LXFilterScreen();
        },
        fullscreenDialog: true, // IOS页面跳转动画
      );
    }
  };

  // 设置未知页面的映射
  static final RouteFactory unknownRoute = (settings) {};
}
