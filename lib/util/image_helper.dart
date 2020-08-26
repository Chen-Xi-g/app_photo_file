import 'package:flutter/cupertino.dart';

/// 图片工具类
class ImageHelper {
  static String png(String name) {
    return "assets/images/$name.png";
  }

  static String jpg(String name) {
    return "assets/images/$name.jpg";
  }

  static Widget iconPng(String name,
      {double width, double height, BoxFit boxFit}) {
    return Image.asset(
      png(name),
      width: width,
      height: height,
      fit: boxFit,
      gaplessPlayback: true,
    );
  }

  static Widget iconJpg(String name,
      {double width, double height, BoxFit boxFit}) {
    return Image.asset(
      jpg(name),
      key: ValueKey<String>(name),
      width: width,
      height: height,
      fit: boxFit,
      gaplessPlayback: true,
    );
  }
}
