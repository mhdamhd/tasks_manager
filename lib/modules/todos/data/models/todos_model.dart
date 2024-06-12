import 'package:tasksmanager/core/models/base_model.dart';
import 'package:tasksmanager/modules/todos/domain/entities/todos_entity.dart';

class TodosModel extends BaseModel<TodosEntity> {
  TodosModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  TodosModel.fromJson(dynamic json) {
    if (json['todos'] != null) {
      todos = [];
      json['todos'].forEach((v) {
        todos?.add(TodoModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  List<TodoModel>? todos;
  num? total;
  num? skip;
  num? limit;

  TodosModel copyWith({
    List<TodoModel>? todos,
    num? total,
    num? skip,
    num? limit,
  }) =>
      TodosModel(
        todos: todos ?? this.todos,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (todos != null) {
      map['todos'] = todos?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

  @override
  TodosEntity toEntity() {
    return TodosEntity(todos: todos?.map((e) => e.toEntity()).toList() ?? []);
  }
}

class TodoModel extends BaseModel<TodoEntity> {
  TodoModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  TodoModel.fromJson(dynamic json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'] is bool ? json['completed'] : json['completed'] == "true";
    userId = json['userId'] is num? ? json['userId'] : num.tryParse(json['userId']);
  }

  num? id;
  String? todo;
  bool? completed;
  num? userId;

  TodoModel copyWith({
    num? id,
    String? todo,
    bool? completed,
    num? userId,
  }) =>
      TodoModel(
        id: id ?? this.id,
        todo: todo ?? this.todo,
        completed: completed ?? this.completed,
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }

  @override
  TodoEntity toEntity() {
    return TodoEntity(
      id: id!.toInt(),
      todo: todo ?? '',
      completed: completed ?? false,
      userId: userId!.toInt(),
    );
  }
}
