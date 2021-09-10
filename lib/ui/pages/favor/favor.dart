// 食物收藏页

import 'package:flutter/material.dart';

import './favor_content.dart';

class LXFavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
      ),
      body: LXFavorContent(),
    );
  }
}
