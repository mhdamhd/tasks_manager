import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksmanager/core/constants/app_constants.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';

class DeleteTodoParameters extends Equatable {
  final int id;

  const DeleteTodoParameters({required this.id});

  @override
  List<Object> get props => [id];
}
