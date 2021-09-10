// 首页

import 'package:flutter/material.dart';

import './home_content.dart';
import './home_app_bar.dart';

class LXHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LXHomeAppBar(context),
      body: LXHomeContent(),
    );
  }
}
