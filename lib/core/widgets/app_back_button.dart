import 'package:flutter/material.dart';
import 'package:todo_app_g12/core/theme/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _goBack(context),
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: AppColors.white,
        size: 32,
      ),
    );
  }
}
