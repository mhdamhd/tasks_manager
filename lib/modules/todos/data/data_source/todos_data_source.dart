import 'package:tasksmanager/modules/todos/data/models/todos_model.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';

abstract class TodosDataSource {
  Future<TodosModel> getTodos(GetTodosParameters parameters);
  Future<TodoModel> addTodo(AddTodoParameters parameters);
  Future<TodoModel> updateTodo(UpdateTodoParameters parameters);
  Future<TodoModel> deleteTodo(DeleteTodoParameters parameters);
}
