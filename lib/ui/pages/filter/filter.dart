// 食物过滤界面

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './filter_content.dart';

class LXFilterScreen extends StatelessWidget {
  static final String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter'),
        centerTitle: true,
      ),
      body: LXFilterContent(),
    );
  }
}
