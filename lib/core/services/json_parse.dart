// json数据解析

import 'dart:convert';

import 'package:flutter/services.dart';
import '../../core/model/category.dart';

class LXJsonParse {
  // 注意同步函数返回值必须为Future
  static Future<List<LXCategoryModel>> getCategoryData() async {
    // 1.加载json文件
    // 使用rootBundle.loadString(key) 异步
    // 参数可以写json资源路径
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    // 2.将json字符串转换为Map/List
    // 使用json.decode方法，还有对应的encode方法（将Map/List转换为json字符串）
    final result = json.decode(jsonString);

    // 3.对Map/List数据再自行处理即可
    final resultList = result['category'];
    List<LXCategoryModel> categories = [];
    for (var category in resultList)
      categories.add(LXCategoryModel.fromJson(category));

    return categories;
  }
}
