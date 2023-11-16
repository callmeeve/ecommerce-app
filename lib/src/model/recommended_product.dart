import 'package:e_commerce/core/app_color.dart';
import 'package:flutter/material.dart' show Color, Colors;

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.primary,
    this.buttonBackgroundColor = Colors.white,
    this.imagePath,
  });
}
