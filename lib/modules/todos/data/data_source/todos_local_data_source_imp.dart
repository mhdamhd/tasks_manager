import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_data_source.dart';
import 'package:tasksmanager/modules/todos/data/models/todos_model.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';

class TodosLocalDataSourceImp extends TodosDataSource {
  @override
  Future<TodosModel> getTodos(GetTodosParameters parameters) async {
    final res = await CacheStorageServices()
        .getTodos(parameters.skip, parameters.pageSize);
    return TodosModel.fromJson(res);
  }

  @override
  Future<void> saveTodos(TodosModel todos, int skip) async {
    await CacheStorageServices().saveTodos(todos, skip);
  }

  @override
  Future<TodoModel> addTodo(AddTodoParameters parameters) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> deleteTodo(DeleteTodoParameters parameters) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> updateTodo(UpdateTodoParameters parameters) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}
