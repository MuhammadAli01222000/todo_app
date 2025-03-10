import 'package:flutter/material.dart';

sealed class AppDimens {
  static const d70 = 70.0;
  static const d24 = 24.0;
  static const d16 = 16.0;
  static const d32 = 32.0;
  static const d64 = 64.0;
  static const d8 = 8.0;
  static const d12 = 12.0;

  static const paddingAll24 = EdgeInsets.all(d24);
  static const paddingH12V24 = EdgeInsets.symmetric(horizontal: d12, vertical: d24);
  static const paddingL16 = EdgeInsets.only(left: d16);
}