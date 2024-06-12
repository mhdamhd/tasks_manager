import 'package:tasksmanager/core/constants/apis_urls.dart';
import 'package:tasksmanager/core/services/api_services.dart';
import 'package:tasksmanager/core/utils/app_response.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_data_source.dart';
import 'package:tasksmanager/modules/todos/data/models/todos_model.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';

class TodosRemoteDataSourceImp extends TodosDataSource {
  @override
  Future<TodosModel> getTodos(GetTodosParameters parameters) async {
    AppResponse appResponse = await ApiServices()
        .get(ApisUrls.getTodos(parameters.toUrl));
    return TodosModel.fromJson(appResponse.data);
  }

  @override
  Future<TodoModel> addTodo(AddTodoParameters parameters, ) async {
    AppResponse appResponse = await ApiServices().post(
      ApisUrls.addTodo,
      data: parameters.toJson()
    );
    return TodoModel.fromJson(appResponse.data);
  }

  @override
  Future<TodoModel> updateTodo(UpdateTodoParameters parameters) async {
    AppResponse appResponse = await ApiServices().put(
        ApisUrls.updateTodo(parameters.id),
        data: parameters.toJson()
    );
    return TodoModel.fromJson(appResponse.data);
  }

  @override
  Future<TodoModel> deleteTodo(DeleteTodoParameters parameters) async {
    AppResponse appResponse = await ApiServices().delete(
        ApisUrls.deleteTodo(parameters.id),
    );
    return TodoModel.fromJson(appResponse.data);
  }
}
