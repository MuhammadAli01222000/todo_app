import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/text_styles.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AppButton({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: AppDimens.d8,
        backgroundColor: AppColors.mainColor,
        fixedSize: const Size(double.maxFinite, AppDimens.d64),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.d16),
          ),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.button,
      ),
    );
  }
}
