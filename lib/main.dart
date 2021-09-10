// 程序入口

import 'package:flutter/material.dart';
import 'package:lx_food_menu/core/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';

import './core/router/router.dart';
import './core/viewmodel/initialize_providers.dart';
import './ui/shared/size_fit.dart';
import './ui/shared/app_theme.dart';

void main() {
  runApp(
    // 设置共享数据
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // rpx,px适配
    LXSizeFit.initialize();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '美食广场',

      // 设置路由相关
      routes: LXRouter.routes,
      initialRoute: LXRouter.initialRoute,
      onGenerateRoute: LXRouter.generateRoute,
      onUnknownRoute: LXRouter.unknownRoute,

      // 主题
      theme: LXAppTheme.norTheme,
    );
  }
}
