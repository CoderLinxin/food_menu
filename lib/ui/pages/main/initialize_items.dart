// 主界面相关Widget准备

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
import '../favor/favor.dart';

// 主页面中的多个子页面(不含路由跳转)
List<Widget> pages = [
  LXHomePage(),
  LXFavorPage(),
];

// 底部导航栏item
List<BottomNavigationBarItem> bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '首页',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.star),
    label: '收藏',
  ),
];
