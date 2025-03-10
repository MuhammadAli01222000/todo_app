import '../model/todo.dart';

class TodoController {

  // singleton:
  TodoController._();
  static final TodoController _instance = TodoController._();
  factory TodoController() => _instance;

  List<Todo> _list = [];
  List<Todo> get items => _list;

  void add(String title, String detail) {
    final todo = Todo(id: _list.length + 1, title: title, description: detail);
    _list.add(todo);
  }

  void edit(String id, String title, String detail) {
    final index = _list.indexWhere((todo) => todo.id.toString() == id);
    if(index == -1) throw Exception();

    _list[index].title = title;
    _list[index].description = detail;
  }

  void delete(int id) {
    _list.removeWhere((todo) => todo.id == id);
  }

  void complete(int id, bool isCompleted) {
    final index = _list.indexWhere((todo) => todo.id == id);
    if(index == -1) throw Exception();

    _list[index].isCompleted = !isCompleted;
  }

  Todo? findTodo(String id) {
    final result = _list.where((todo) => todo.id.toString() == id);
    return result.firstOrNull;
  }
}
