
import 'package:flutter/material.dart';
import 'package:todo_app_g12/core/theme/colors.dart';
import 'package:todo_app_g12/core/theme/dimens.dart';
import 'package:todo_app_g12/core/theme/icons.dart';
import 'package:todo_app_g12/model/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final void Function(Todo)? edit;
  final void Function(Todo)? delete;
  final void Function(Todo)? check;

  const TodoCard({required this.todo, this.edit, this.delete, this.check, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        contentPadding: AppDimens.paddingL16,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (edit != null) IconButton(onPressed: () => edit!(todo), icon: AppIcons.pencil),
            if (delete != null) IconButton(onPressed: () => delete!(todo), icon: AppIcons.trash),
            if (check != null)
              IconButton(
                onPressed: () => check!(todo),
                icon: AppIcons.checkCircle.copyWith(
                  color: todo.isCompleted ? AppColors.green : AppColors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
