import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

sealed class AppTextStyles {
  static const TextStyle appBar = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle input = TextStyle(
    fontSize: AppDimens.d16,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppDimens.d16,
    color: AppColors.white,
  );

  static const TextStyle hint = TextStyle(
    fontSize: AppDimens.d16,
    color: AppColors.grey,
  );
}
