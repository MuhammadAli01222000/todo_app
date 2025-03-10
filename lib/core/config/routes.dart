import 'package:flutter/material.dart';
import 'package:todo_app_g12/screen/completed.dart';
import 'package:todo_app_g12/screen/detail.dart';
import 'package:todo_app_g12/screen/home.dart';

sealed class AppRoutes {
  static const home = "/";
  static const detail = "detail";
  static const completed = "completed";

  static Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    home: (context) => const Home(),
    detail: (context) => Detail(id: ModalRoute.of(context)?.settings.arguments as String?),
    completed: (context) => const Completed(),
  };
}