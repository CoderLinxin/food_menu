// 应用主题相关

import 'package:flutter/material.dart';

class LXAppTheme {
  // 共有属性
  static const double _bodyFontSize = 16;
  static const double _smallFontSize = 18;
  static const double _normalFontSize = 20;
  static const double _largeFontSize = 24;
  static const double _moreLargeFontSize = 28;

  // 普通模式
  static final Color _norTextColor = Colors.red;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 222, 1), // 表示整个应用程序的背景色
    accentColor: Colors.orange,

    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: _bodyFontSize, color: Colors.black87),
      headline4: TextStyle(fontSize: _smallFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: _normalFontSize, color: Colors.black87),
      headline2: TextStyle(fontSize: _largeFontSize, color: Colors.black87),
      headline1: TextStyle(fontSize: _moreLargeFontSize, color: Colors.black87),
    ),
  );

// 暗黑模式(待补充)
}
