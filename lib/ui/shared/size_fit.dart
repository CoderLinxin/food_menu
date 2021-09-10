// rpx适配

import 'dart:ui';

class LXSizeFit {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double dpr;
  static late double width;
  static late double height;
  static late double statusHeight;
  static late double rpx;
  static late double px;

  // 进行屏幕适配前需要先调用该方法进行设备信息获取的初始化
  // 默认采用iphone6为设计稿(所有手机都根据iphone6宽度的总逻辑像素和总物理像素进行划分)
  static void initialize(
      {double standardSize = 750, double standardSizeRatio = 2}) {
    // 获取手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 获取dpr
    dpr = window.devicePixelRatio;

    // 获取手机屏幕大小（逻辑分辨率）
    width = window.physicalSize.width / window.devicePixelRatio;
    height = window.physicalSize.height / window.devicePixelRatio;

    // 状态栏（padding）高度
    statusHeight = window.padding.top / dpr;

    // 计算rpx（根据逻辑像素进行划分）
    rpx = width / standardSize;

    // 计算px（根据物理像素进行划分）
    px = width / standardSize * standardSizeRatio;
  }

  // 设计稿单位为点时使用该方法。
  static double setRpx(double size) {
    return rpx * size;
  }

  // 设计稿单位为物理像素时使用该方法
  static double setPx(double size) {
    return px * size;
  }
}

// 定义double扩展
extension DoubleFit on double {
  double get px => LXSizeFit.setPx(this);

  double get rpx => LXSizeFit.setRpx(this);
}

// 定义int扩展
extension IntFit on int {
  double get px => LXSizeFit.setPx(this.toDouble());

  double get rpx => LXSizeFit.setRpx(this.toDouble());
}
