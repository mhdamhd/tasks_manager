import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksmanager/core/core_compoent/app_container.dart';
import 'package:tasksmanager/core/extensions/theme_extensions/text_theme_extension.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/todos_bloc/todos_bloc.dart';

class TodoCard extends StatelessWidget {
  final TodoEntity todo;

  const TodoCard({Key? key, required this.todo}) : super(key: key);

  void _checkPressed(BuildContext context, bool value) {
    context.read<TodosBloc>().add(UpdateTodoEvent(id: todo.id, completed: value));
  }

  void _deletePressed(BuildContext context) {
    context.read<TodosBloc>().add(DeleteTodoEvent(id: todo.id));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Checkbox(value: todo.completed, onChanged: (val) => _checkPressed(context, val ?? false)),
          Expanded(
            child: AppContainer(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(todo.todo, style: context.f16600),
            ),
          ),
          IconButton(
              onPressed: () => _deletePressed(context),
              icon: const Icon(Icons.delete, color: Colors.red, size: 30)),
        ],
      ),
    );
  }
}
