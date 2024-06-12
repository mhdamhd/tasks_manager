import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:tasksmanager/modules/auth/data/models/user_model.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/parameters/login_parameters.dart';
import '../../domain/parameters/register_parameters.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImp(this.authDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParameters parameters) async {
    try {
      final UserModel res = await authDataSource.login(parameters);
      final user = res.toEntity();
      await CacheStorageServices().setToken(user.token);
      await CacheStorageServices().setUser(user);
      return Right(user);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters) async {
    try {
      final UserModel res = await authDataSource.register(parameters);
      final user = res.toEntity();
      await CacheStorageServices().setToken(user.token);
      await CacheStorageServices().setUser(user);
      return Right(user);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }

  }
}
