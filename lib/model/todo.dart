class Todo {
  final int id;
  String title;
  String description;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return "Todo(id: $id, title: $title, description: $description, isCompleted: $isCompleted)";
  }
}