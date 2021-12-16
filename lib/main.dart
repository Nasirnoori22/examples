import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'todo.dart';

/// Some keys used for testing
final addTodoKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

/// Creates a [TodoList] and initialise it with pre-defined values.
///
/// We are using [StateNotifierProvider] here as a `List<Todo>` is a complex
/// object, with advanced business logic like how to edit a todo.
final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(id: 'todo-0', description: 'hi', department: 'designeer'),
    Todo(id: 'todo-1', description: 'hello', department: 'Hr'),
    Todo(id: 'todo-2', description: 'bonjour', department: 'developer'),
  ]);
});

/// The different ways to filter the list of todos
enum TodoListFilter {
  all,
  active,
  completed,
}

final todoListFilter = StateProvider((_) => TodoListFilter.all);

final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

/// The list of todos after applying of [todoListFilter].
///
/// This too uses [Provider], to avoid recomputing the filtered list unless either
/// the filter of or the todo-list updates.
final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  List<Todo> filteredTodos;

  switch (filter) {
    case TodoListFilter.completed:
      return filteredTodos = todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return filteredTodos = todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
    default:
      filteredTodos = todos;
      break;
  }
  return filteredTodos = todos;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);
    final newTodoController = useTextEditingController();
    final newTwoController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          children: [
            const Title(),
            TextField(
              key: addTodoKey,
              controller: newTodoController,
              decoration: const InputDecoration(
                labelText: 'What needs to be done?',
              ),
            ),
            TextField(
              key: addTodoKey,
              controller: newTwoController,
              decoration: const InputDecoration(
                labelText: 'What needs to be done?',
              ),
            ),
            FlatButton(
                child: Text('add to list'),
                onPressed: () {
                  ref
                      .read(todoListProvider.notifier)
                      .add(newTwoController.text, newTodoController.text);
                }),
            const SizedBox(height: 42),
            const Toolbar(),
            if (todos.isNotEmpty) const Divider(height: 0),
            for (var i = 0; i < todos.length; i++) ...[
              if (i > 0) const Divider(height: 0),
              Dismissible(
                key: ValueKey(todos[i].id),
                onDismissed: (_) {
                  ref.read(todoListProvider.notifier).remove(todos[i]);
                },
                child: ProviderScope(
                  overrides: [
                    _currentTodo.overrideWithValue(todos[i]),
                  ],
                  child: const TodoItem(),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.blue : Colors.black;
    }

    return Material(child: Row());
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'todos',
    );
  }
}

/// A provider which exposes the [Todo] displayed by a [TodoItem].
///
/// By retreiving the [Todo] through a provider instead of through its
/// constructor, this allows [TodoItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit todos, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
///
/// the list UI start from here point to be notted
final _currentTodo = Provider<Todo>((ref) => throw UnimplementedError());

class TodoItem extends HookConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(_currentTodo);
    final itemFocusNode = useFocusNode();
    // listen to focus chances
    useListenable(itemFocusNode);
    final isFocused = itemFocusNode.hasFocus;

    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Material(
        color: Colors.white,
        elevation: 6,
        child: Focus(
          focusNode: itemFocusNode,
          onFocusChange: (focused) {
            if (focused) {
              textEditingController.text = todo.description;
              textEditingController.text = todo.department;
            } else {
              // Commit changes only when the textfield is unfocused, for performance
              ref.read(todoListProvider.notifier).edit(
                  id: todo.id,
                  description: textEditingController.text,
                  department: textEditingController.text);
            }
          },
          child: ListTile(
              leading: Checkbox(
                value: todo.completed,
                onChanged: (value) =>
                    ref.read(todoListProvider.notifier).toggle(todo.id),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFocused
                      ? TextField(
                          autofocus: true,
                          focusNode: textFieldFocusNode,
                          controller: textEditingController,
                        )
                      : Text(todo.description),
                  isFocused
                      ? TextField(
                          autofocus: true,
                          focusNode: textFieldFocusNode,
                          controller: textEditingController,
                        )
                      : Text(todo.department),
                ],
              )),
        ));
  }
}
