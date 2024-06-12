import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksmanager/core/constants/app_constants.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';

class UpdateTodoParameters extends Equatable {
  final int id;
  final bool completed;

  const UpdateTodoParameters({required this.id, required this.completed});

  Map<String, dynamic> toJson() => {
    'completed' : completed,
  };

  @override
  List<Object> get props => [id, completed];
}
