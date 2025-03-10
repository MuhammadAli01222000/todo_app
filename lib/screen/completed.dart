import 'package:flutter/material.dart';
import 'package:todo_app_g12/core/theme/colors.dart';
import 'package:todo_app_g12/core/theme/dimens.dart';
import 'package:todo_app_g12/core/theme/strings.dart';
import 'package:todo_app_g12/core/theme/text_styles.dart';
import 'package:todo_app_g12/core/widgets/app_back_button.dart';
import 'package:todo_app_g12/core/widgets/todo_card.dart';
import 'package:todo_app_g12/service/todo_controller.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final TodoController todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.mainColor,
        leading: const AppBackButton(),
        title: const Text(AppStrings.completedTask, style: AppTextStyles.appBar),
      ),
      body: ListView.builder(
        padding: AppDimens.paddingH12V24,
        itemCount: todoController.completedItems.length,
        itemBuilder: (_, i) => TodoCard(todo: todoController.completedItems[i]),
      ),
    );
  }
}
