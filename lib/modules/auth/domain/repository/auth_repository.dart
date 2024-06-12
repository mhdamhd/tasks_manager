import 'package:tasksmanager/core/errors/failure.dart';
import 'package:tasksmanager/modules/auth/domain/entities/user_entity.dart';
import 'package:tasksmanager/modules/auth/domain/parameters/login_parameters.dart';
import 'package:tasksmanager/modules/auth/domain/parameters/register_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(LoginParameters parameters);
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters);
}
