import 'package:get_it/get_it.dart';
import 'package:tasksmanager/modules/auth/data/data_source/auth_data_source.dart';
import 'package:tasksmanager/modules/auth/data/data_source/auth_remote_data_source_imp.dart';
import 'package:tasksmanager/modules/auth/data/repository/auth_repository_imp.dart';
import 'package:tasksmanager/modules/auth/domain/repository/auth_repository.dart';
import 'package:tasksmanager/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:tasksmanager/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_local_data_source_imp.dart';
import 'package:tasksmanager/modules/todos/data/data_source/todos_remote_data_source_imp.dart';
import 'package:tasksmanager/modules/todos/data/repository/todos_repository_imp.dart';
import 'package:tasksmanager/modules/todos/domain/repository/todos_repository.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:tasksmanager/modules/todos/presentation/blocs/todos_bloc/todos_bloc.dart';

final sl = GetIt.instance;

/// This class [ServicesLocator] is define to inject values and variables (Objects) into memory when the application is opened,
/// those values will remain stored and preserved for direct access in randomaccess memory according to the specified conditions
/// and situations.
///
/// The concept of injection depends on dependency injection, using the get_it library to provide this type of service,
///
/// it is necessary You have to call [ServicesLocator.init] in main.dart, main finction, before [runApp]
///
/// 1- to inject Your Bloc object use [registerFactory] function
///    Ex:   sl.registerFactory(() => YourBloc(sl()));
/// 2- to inject Your Repository, Data Source object use [registerLazySingleton] function
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///
/// you can get any Object you inject by call [sl]
///    Ex: sl<YourBloc>();

// TODO: add (BLOCs , REPOSITORIES , DATA SOURCES)
class ServicesLocator {
  static ServicesLocator? _instance;
  ServicesLocator._();
  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    //// BLOCS
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerFactory(() => TodosBloc(sl()));

    sl.registerFactory(() => RegisterBloc(sl()));

    sl.registerLazySingleton(() => AppConfigBloc());

    //// REPOSITORIES
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl()));
    sl.registerLazySingleton<TodosRepository>(() => TodosRepositoryImp(sl(), sl()));


    //// DATA SOURCES
    sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSourceImp());
    sl.registerLazySingleton<TodosRemoteDataSourceImp>(() => TodosRemoteDataSourceImp());
    sl.registerLazySingleton<TodosLocalDataSourceImp>(() => TodosLocalDataSourceImp());

  }
}
