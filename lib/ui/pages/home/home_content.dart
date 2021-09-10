// 首页主体部分

import 'package:flutter/material.dart';

import 'package:lx_food_menu/core/model/category.dart';
import 'package:lx_food_menu/core/services/json_parse.dart';
import 'package:lx_food_menu/ui/shared/size_fit.dart';
import './home_category_item.dart';

class LXHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用FutureBuilder根据异步请求来构建界面
    return FutureBuilder<List<LXCategoryModel>>(
      future: LXJsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (snapshot.error != null)
          return Center(
            child: Text(
              '请求失败',
              style: Theme.of(context).textTheme.headline3,
            ),
          );

        final List<LXCategoryModel>? categories = snapshot.data;

        // 九宫格菜单界面
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: categories?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final LXCategoryModel category = categories![index];

            // 构建单个目录
            return LXCategoryItem(category);
          },
        );
      },
    );
  }
}
