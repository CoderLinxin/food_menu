// 食物过滤界面主体部分

import 'package:flutter/material.dart';
import 'package:lx_food_menu/core/viewmodel/filter_view_model.dart';

import 'package:lx_food_menu/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

class LXFilterContent extends StatelessWidget {
  final List<String> _filterListTitles = [
    '无骨蛋白',
    '不含乳糖',
    '普通素食者',
    '严格素食者',
  ];

  final List<String> _filterListSubTitles = [
    '展示无骨蛋白食物',
    '展示不含乳糖食物',
    '展示普通素食相关食物',
    '展示严格素食者相关食物',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 顶部标题
        buildTitleUI(context),

        // 过滤列表
        buildFilterListUI(),
      ],
    );
  }

  // 创建顶部标题UI
  Widget buildTitleUI(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        '展示你的选择',
        style: Theme.of(context).textTheme.headline3?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // 创建过滤列表UI
  Widget buildFilterListUI() {
    return Expanded(
      child: Consumer<LXFilterViewModel>(
        builder: (context, filterVm, child) {
          List<bool> filters = [
            filterVm.isGlutenFree,
            filterVm.isVegan,
            filterVm.isVegetarian,
            filterVm.isLactoseFree
          ];

          return ListView.builder(
            itemCount: _filterListTitles.length,
            itemBuilder: (context, index) {
              return buildFilterListItem(
                title: _filterListTitles[index],
                onChanged: (value) {
                  switch (index) {
                    case 0:
                      filterVm.isGlutenFree = value;
                      return;
                    case 1:
                      filterVm.isVegan = value;
                      return;
                    case 2:
                      filterVm.isVegetarian = value;
                      return;
                    case 3:
                      filterVm.isLactoseFree = value;
                      return;
                  }
                },
                subTitle: _filterListSubTitles[index],
                value: filters[index],
              );
            },
          );
        },
      ),
    );
  }

  // 创建过滤列表Item
  Widget buildFilterListItem({
    required String title,
    required String subTitle,
    required void Function(bool value) onChanged,
    required bool value,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
