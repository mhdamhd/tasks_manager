import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tasksmanager/core/errors/errors_handler.dart';
import 'package:tasksmanager/core/errors/exception.dart';
import 'package:tasksmanager/core/errors/failure.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_local_data_source_imp.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_remote_data_source_imp.dart';
import 'package:tasksmanager/modules/todos/data/models/todos_model.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/repository/todos_repository.dart';

class TodosRepositoryImp extends TodosRepository {
  final TodosRemoteDataSourceImp todosRemoteDataSource;
  final TodosLocalDataSourceImp todosLocalDataSource;

  TodosRepositoryImp(this.todosRemoteDataSource, this.todosLocalDataSource);

  @override
  Future<Either<Failure, TodosEntity>> getTodos(GetTodosParameters parameters) async {
    try {
        debugPrint("Fetching remote data...");
        final TodosModel res = await todosRemoteDataSource.getTodos(parameters);
        await todosLocalDataSource.saveTodos(res, parameters.skip);
        final todos = res.toEntity();
        return Right(todos);
    } catch (e, s) {
      if (e is NoInternetException) {
        debugPrint("Fetching local data...");
        return ErrorsHandler.handleEither(() => todosLocalDataSource.getTodos(parameters));
      }
      debugPrint(e.toString());
      debugPrint(s.toString());
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> addTodo(AddTodoParameters parameters) async {
    return ErrorsHandler.handleEither(
        () => todosRemoteDataSource.addTodo(parameters));
  }

  @override
  Future<Either<Failure, TodoEntity>> updateTodo(
      UpdateTodoParameters parameters) {
    return ErrorsHandler.handleEither(
            () => todosRemoteDataSource.updateTodo(parameters));
  }

  @override
  Future<Either<Failure, TodoEntity>> deleteTodo(
      DeleteTodoParameters parameters) {
    return ErrorsHandler.handleEither(
            () => todosRemoteDataSource.deleteTodo(parameters));
  }

  @override
  Future testTodo(GetTodosParameters parameters) {
    // TODO: implement testTodo
    throw UnimplementedError();
  }
}
