// 首页菜单目录（单个个体）模型

import 'package:flutter/cupertino.dart';

class LXCategoryModel {
  late String id;
  late String title;
  late String color;

  late Color cColor; // 16进制表示的Color

  LXCategoryModel({required this.id, required this.title, required this.color});

  LXCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 字符串转为16进制数
    final int hexColor = int.parse(color, radix: 16);

    // 加上透明度表示
    cColor = Color(hexColor + 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
