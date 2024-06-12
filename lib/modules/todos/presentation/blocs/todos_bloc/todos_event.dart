part of 'todos_bloc.dart';

class TodosEvent extends Equatable {
  const TodosEvent();
  @override
  List<Object> get props => [];
}

class FetchTodosEvent extends TodosEvent {
  final bool refresh;
  const FetchTodosEvent({this.refresh = false});
}

class AddTodoEvent extends TodosEvent {
  final String todo;
  const AddTodoEvent({required this.todo});
}

class UpdateTodoEvent extends TodosEvent {
  final int id;
  final bool completed;
  const UpdateTodoEvent({required this.id, required this.completed});
}

class DeleteTodoEvent extends TodosEvent {
  final int id;
  const DeleteTodoEvent({required this.id});
}