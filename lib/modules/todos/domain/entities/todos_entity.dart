import 'package:tasksmanager/core/entities/base_entity.dart';

class TodosEntity extends BaseEntity {
  final List<TodoEntity> todos;

  TodosEntity({required this.todos});

  factory TodosEntity.fromJson(dynamic json) {
    List<TodoEntity> todos = [];
    if (json['todos'] != null) {
      json['todos'].forEach((v) {
        todos.add(TodoEntity.fromJson(v));
      });
    }
    return TodosEntity(todos: todos);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todos'] = todos.map((v) => v.toJson()).toList();;
    return map;
  }

  @override
  List<Object?> get props => [todos];
}

class TodoEntity extends BaseEntity {
  final int id;
  final String todo;
  bool completed;
  final int userId;

  TodoEntity(
      {required this.id,
      required this.todo,
      required this.completed,
      required this.userId});

  factory TodoEntity.fromJson(dynamic json) {
    return TodoEntity(
        id: int.parse(json['id']),
        todo: json['todo'],
        completed: json['completed'] == "true",
        userId: int.parse(json['userId'])
    );
  }

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['id'] = id.toString();
    map['todo'] = todo;
    map['completed'] = completed.toString();
    map['userId'] = userId.toString();
    return map;
  }

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
