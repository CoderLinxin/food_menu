// 主界面（路由默认跳转界面）

import 'package:flutter/material.dart';

import './initialize_items.dart';
import 'package:lx_food_menu/ui/pages/home/home_drawer.dart';

class LXMainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _LXMainScreenState createState() => _LXMainScreenState();
}

class _LXMainScreenState extends State<LXMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 底部导航栏Item对应页面
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: bottomNavBarItems,
        onTap: (value) => setState(() => _currentIndex = value),
      ),

      // drawer
      drawer: LXHomeDrawer(),
    );
  }
}
