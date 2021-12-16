import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// A read-only description of a todo-item
class Todo {
  Todo({
    required this.description,
    required this.id,
    this.completed = false,
    required this.department,
  });

  final String id;
  final String description;
  final bool completed;
  final String department;

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}

/// An object that controls a list of [Todo].
class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description, String department) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
        department: department,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
            department: todo.department,
          )
        else
          todo,
    ];
  }

  void edit({
    required String id,
    required String description,
    required String department,
  }) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
            department: department,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
