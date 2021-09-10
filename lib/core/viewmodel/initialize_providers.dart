// 管理所有的Provider

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './meal_view_model.dart';
import './favor_meal_view_model.dart';
import './filter_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => LXFilterViewModel()),
  // LXMealViewModel依赖于LXFilterViewModel的写法
  ChangeNotifierProxyProvider<LXFilterViewModel, LXMealViewModel?>(
    create: (context) => LXMealViewModel(),
    update: (context, filterVM, mealVM) {
      mealVM?.updateFilter(filterVM);
      return mealVM;
    },
  ),
  // LXFavorMealViewModel依赖于LXFilterViewModel的写法
  ChangeNotifierProxyProvider<LXFilterViewModel, LXFavorMealViewModel?>(
    create: (context) => LXFavorMealViewModel(),
    update: (context, filterVM, favorMealVM) {
      favorMealVM?.updateFilter(filterVM);
      return favorMealVM;
    },
  ),
];
