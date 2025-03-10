import 'package:flutter/material.dart';
import 'package:todo_app_g12/core/theme/colors.dart';
import 'package:todo_app_g12/core/theme/dimens.dart';
import 'package:todo_app_g12/core/theme/strings.dart';
import 'package:todo_app_g12/core/theme/text_styles.dart';
import 'package:todo_app_g12/core/utils/app_snackbar.dart';
import 'package:todo_app_g12/core/widgets/app_button.dart';
import 'package:todo_app_g12/model/todo.dart';
import 'package:todo_app_g12/service/todo_controller.dart';

import '../core/widgets/app_text_field.dart';

class Detail extends StatefulWidget {
  final String? id;
  const Detail({this.id, super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late final TextEditingController titleController;
  late final TextEditingController detailController;
  TodoController controller = TodoController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }

  void _initialize() {
    Todo? todo;
    if (widget.id != null) todo = controller.findTodo(widget.id!);
    titleController = TextEditingController(text: todo?.title);
    detailController = TextEditingController(text: todo?.description);
  }

  void _addTodo() {
    final title = titleController.text;
    final detail = detailController.text;

    if (title.isEmpty || detail.isEmpty) {
      AppSnackbar.msg(context, AppStrings.emptyInputs);
      return;
    }

    controller.add(title, detail);
    Navigator.pop(context, true);
  }

  void _updateTodo() {
    final title = titleController.text;
    final detail = detailController.text;

    if (title.isEmpty || detail.isEmpty) {
      AppSnackbar.msg(context, AppStrings.emptyInputs);
      return;
    }

    try {
      controller.edit(widget.id!, title, detail);
      Navigator.pop(context, true);
    } catch (e) {
      AppSnackbar.msg(context, AppStrings.cantFindTodo);
    }
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.white,
            size: 32,
          ),
        ),
        title: Text(
          widget.id == null ? AppStrings.addTask : AppStrings.editTask,
          style: AppTextStyles.appBar,
        ),
      ),
      body: Padding(
        padding: AppDimens.paddingAll24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// #title
            AppTextField(controller: titleController, title: AppStrings.title),

            /// #detail
            AppTextField(controller: detailController, title: AppStrings.detail),

            /// #create: add button
            if (widget.id == null)
              AppButton(onPressed: _addTodo, title: AppStrings.add)

            /// #edit: cancel and update
            else
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: _updateTodo,
                      title: AppStrings.update,
                    ),
                  ),
                  const SizedBox(width: AppDimens.d32),
                  Expanded(
                    child: AppButton(
                      onPressed: _goBack,
                      title: AppStrings.cancel,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
