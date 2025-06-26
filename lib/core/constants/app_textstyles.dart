import 'package:flutter/material.dart';
import 'package:profile_editor/core/constants/app_colors.dart';

class AppTextStyles {
  static const _fontFamily = 'Poppins';

  static   TextStyle extraLight = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: AppColors.black,
  );

  static const TextStyle regular = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color:AppColors.black,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.black87,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.black87,
  );

  // static const TextStyle bold = TextStyle(
  //   fontFamily: _fontFamily,
  //   fontWeight: FontWeight.w700,
  //   fontSize: 20,
  //   color: Colors.black87,
  // );

  static const TextStyle extraBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 22,
    color: AppColors.black87,
  );

  static const TextStyle black = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: AppColors.black,
  );

  static const TextStyle label = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.grey,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.grey,
  );
}
