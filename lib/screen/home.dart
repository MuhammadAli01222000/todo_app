import 'package:flutter/material.dart';
import 'package:todo_app_g12/core/config/routes.dart';
import 'package:todo_app_g12/core/theme/colors.dart';
import 'package:todo_app_g12/core/theme/dimens.dart';
import 'package:todo_app_g12/core/theme/icons.dart';
import 'package:todo_app_g12/core/theme/strings.dart';
import 'package:todo_app_g12/core/theme/text_styles.dart';
import 'package:todo_app_g12/core/utils/app_snackbar.dart';
import 'package:todo_app_g12/core/widgets/todo_card.dart';
import 'package:todo_app_g12/service/todo_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoController todoController = TodoController();

  void _goAddTodoScreen() async {
    Navigator.of(context).pushNamed(AppRoutes.detail).then((value) {
      if (value != null && value == true) {
        if (mounted) setState(() {});
      }
    });
  }

  void _editTodo(int id) async {
    Navigator.of(context).pushNamed(AppRoutes.detail, arguments: id.toString()).then((value) {
      if (value != null && value == true) {
        if (mounted) setState(() {});
      }
    });
  }

  void _deleteTodo(int id) async {
    setState(() => todoController.delete(id));
    AppSnackbar.msg(context, AppStrings.successfullyDeleted);
  }

  void _checkTodo(int id, bool isCompleted) {
    try {
      setState(() => todoController.complete(id, isCompleted));
    } catch (e) {
      AppSnackbar.msg(context, AppStrings.cantFindTodo);
    }
  }

  void _goCompleted(int page) {
    if(page == 1) {
      Navigator.of(context).pushNamed(AppRoutes.completed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: _floatingActionButton(),
      body: ListView.builder(
        padding: AppDimens.paddingH12V24,
        itemCount: todoController.items.length,
        itemBuilder: (_, index) => TodoCard(
          todo: todoController.items[index],
          edit: (todo) => _editTodo(todo.id),
          delete: (todo) => _deleteTodo(todo.id),
          check: (todo) => _checkTodo(todo.id, todo.isCompleted),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: false,
      title: const Text(AppStrings.appName, style: AppTextStyles.appBar),
      backgroundColor: AppColors.mainColor,
      actions: [AppIcons.calendar],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.mainColor,
      backgroundColor: AppColors.white,
      onTap: _goCompleted,
      items: [
        BottomNavigationBarItem(icon: AppIcons.playlist, label: AppStrings.all),
        BottomNavigationBarItem(icon: AppIcons.tick, label: AppStrings.completed),
      ],
    );
  }

  SizedBox _floatingActionButton() {
    return SizedBox(
      height: AppDimens.d70,
      width: AppDimens.d70,
      child: FloatingActionButton(
        onPressed: _goAddTodoScreen,
        backgroundColor: AppColors.mainColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}