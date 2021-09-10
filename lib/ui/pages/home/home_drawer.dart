// 首页Drawer组件封装（后来决定将其放在main主页面中）

import 'package:flutter/material.dart';
import 'package:lx_food_menu/ui/pages/filter/filter.dart';
import 'package:lx_food_menu/ui/shared/size_fit.dart';

class LXHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeadView(context),
            SizedBox(
              height: 10.px,
            ),
            buildOperateUIItem(
                context: context,
                icon: Icon(Icons.restaurant),
                title: '进餐',
                onTap: () {}),
            buildOperateUIItem(
                context: context,
                icon: Icon(Icons.settings),
                title: '过滤',
                onTap: () {
                  // 跳转到过滤界面
                  Navigator.of(context).pushNamed(LXFilterScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }

  // Drawer顶部标题Widget
  Widget buildHeadView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.px,
      color: Theme.of(context).accentColor,
      alignment: Alignment(0, 0.5),
      child: Text(
        '开始动手',
        style: Theme.of(context).textTheme.headline1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  //  中部操作UI Item封装
  Widget buildOperateUIItem({
    required BuildContext context,
    required Icon icon,
    required String title,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
