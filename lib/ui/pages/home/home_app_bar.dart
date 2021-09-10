// 主页面Appbar封装

import 'package:flutter/material.dart';

class LXHomeAppBar extends AppBar {
  // 将原本在AppBar中的内容传给父Widget（AppBar）即可
  LXHomeAppBar(BuildContext context)
      : super(
          title: Text('美食广场'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // 点击打开Drawer
              Scaffold.of(context).openDrawer();
            },
          ),
        );
}
