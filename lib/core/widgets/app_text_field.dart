import 'package:flutter/material.dart';

import '../theme/dimens.dart';
import '../theme/text_styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final double bottom;
  const AppTextField({required this.controller, required this.title, this.bottom = AppDimens.d32, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          style: AppTextStyles.input,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: AppTextStyles.hint,
          ),
        ),
        SizedBox(height: bottom),
      ],
    );
  }
}
