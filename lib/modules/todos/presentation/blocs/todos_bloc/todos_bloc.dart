import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tasksmanager/core/constants/app_constants.dart';
import 'package:tasksmanager/core/utils/base_state.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/add_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/delete_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/todos_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/parameters/update_todo_parameters.dart';
import 'package:tasksmanager/modules/todos/domain/repository/todos_repository.dart';

part 'todos_event.dart';

class TodosBloc
    extends Bloc<TodosEvent, BaseState<TodosEntity>> {
  final TodosRepository todosRepository;


  TodosBloc(this.todosRepository)
      : super(const BaseState<TodosEntity>()) {
    on<FetchTodosEvent>(_getTodos);
    on<AddTodoEvent>(_addTodos);
    on<UpdateTodoEvent>(_updateTodos);
    on<DeleteTodoEvent>(_deleteTodos);
  }

  final int _length = AppConstants.paginationPageSize;
  int _page = 0;
  bool enablePullUp = true;
  // final RefreshController refreshController = RefreshController();


  FutureOr<void> _getTodos(FetchTodosEvent event, emit) async {
    TodosEntity? todosEntity = state.data;
    if (event.refresh) {
      _page = 0;
      enablePullUp = true;
      todosEntity = TodosEntity(todos: const []);
    }
    if(_page == 0) emit(state.loading(newData: todosEntity));
    final result = await todosRepository.getTodos(GetTodosParameters(
      pageSize: _length,
      pageIndex: _page
    ));
    result.fold((l) => emit(state.error(l)), (r) {
      _page++;
      if(r.todos.isEmpty || r.todos.length < _length) {
        enablePullUp = false;
      }
      todosEntity = TodosEntity(todos: (todosEntity?.todos ?? []) + r.todos);
      // refreshController.loadComplete();
      // refreshController.refreshCompleted();
      emit(state.success(todosEntity!, enablePullUp: enablePullUp));
    });
  }

  FutureOr<void> _addTodos(AddTodoEvent event, emit) async {
    TodosEntity? todosEntity = state.data;
    emit(state.updating());
    final result = await todosRepository.addTodo(AddTodoParameters(todo: event.todo));
    result.fold((l) => emit(state.updateError(l)), (r) {
      todosEntity = TodosEntity(todos: [r, ...(todosEntity?.todos ?? [])]);
      emit(state.updateSuccess(todosEntity!));
    });
  }

  FutureOr<void> _updateTodos(UpdateTodoEvent event, emit) async {
    TodosEntity? todosEntity = state.data;
    emit(state.updating());
    final result = await todosRepository.updateTodo(UpdateTodoParameters(id: event.id, completed: event.completed));
    result.fold((l) => emit(state.updateError(l)), (r) {
      todosEntity?.todos.where((element) => element.id == r.id).toList().first.completed = r.completed;
      todosEntity = TodosEntity(todos: todosEntity?.todos ?? []);
      emit(state.updateSuccess(todosEntity!));
    });
  }

  FutureOr<void> _deleteTodos(DeleteTodoEvent event, emit) async {
    TodosEntity? todosEntity = state.data;
    emit(state.updating());
    final result = await todosRepository.deleteTodo(DeleteTodoParameters(id: event.id));
    result.fold((l) => emit(state.updateError(l)), (r) {
      todosEntity?.todos.removeWhere((element) => element.id == r.id);
      todosEntity = TodosEntity(todos: todosEntity?.todos ?? []);
      emit(state.updateSuccess(todosEntity!));
    });
  }
}
