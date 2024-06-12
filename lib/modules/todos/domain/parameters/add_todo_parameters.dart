import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksmanager/core/constants/app_constants.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';

class AddTodoParameters extends Equatable {
  final String todo;

  const AddTodoParameters({required this.todo});

  Map<String, dynamic> toJson() => {
    'todo' : todo,
    'completed' : false,
    'userId' : 5
  };

  @override
  List<Object> get props => [todo];
}
