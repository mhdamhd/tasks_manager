import 'package:dartz/dartz.dart';
import 'package:tasksmanager/core/errors/failure.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';

abstract class TodosRepository {
  Future<Either<Failure, TodosEntity>> getTodos(GetTodosParameters parameters);
  Future<Either<Failure, TodoEntity>> addTodo(AddTodoParameters parameters);
  Future<Either<Failure, TodoEntity>> updateTodo(UpdateTodoParameters parameters);
  Future<Either<Failure, TodoEntity>> deleteTodo(DeleteTodoParameters parameters);
}
