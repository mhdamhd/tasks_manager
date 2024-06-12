import 'dart:convert';

import 'package:tasksmanager/modules/auth/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasksmanager/modules/todos/data/models/todos_model.dart';

/// [CacheStorageServices] services express services related to storing variables in the cache
/// By defining a [_Keys] variable suitable for the value to be stored, and defining the following 4 methods,
/// you will be able to store any value in memory via these services.
/// 1- [setValue] to store value in cache
///    Future<void> setValue(String value) async => await _preferences?.setString(_Keys.value, value)
/// 2- [removeValue] to remove value from cache
///    Future<void> removeValue() async => await _preferences?.remove(_Keys.value);
/// 3- [value] to get value from cache
///    String? get value => _preferences?.getString(_Keys.value) ?? null;
/// 4- [hasValue] check if this variable stored or not
///    bool get hasValue => _preferences?.containsKey(_Keys.value) ?? false;
///
/// It is important to call [CacheStorageServices.init] in the main.dart file before the [runApp] function
/// await CacheStorageServices.init();

class CacheStorageServices {
  static CacheStorageServices? _instance;
  static SharedPreferences? _preferences;

  CacheStorageServices._();

  factory CacheStorageServices() => _instance ??= CacheStorageServices._();

  // should call init in your main before run app
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // handle store API user token in cache
  Future<void> setToken(String token) async => await _preferences?.setString(_Keys.token, token);

  Future<void> removeToken() async => await _preferences?.remove(_Keys.token);

  bool get hasToken => _preferences?.containsKey(_Keys.token) ?? false;

  String get token => _preferences?.getString(_Keys.token) ?? 'no token';

  Future<void> setLocale(String locale) async =>
      await _preferences?.setString(_Keys.locale, locale);

  String? get locale => _preferences?.getString(_Keys.locale);

  Future<void> setUser(UserEntity user) async => await _preferences?.setString(_Keys.user, jsonEncode(user.toJson()));

  Future<void> removeUser() async => await _preferences?.remove(_Keys.user);

  UserEntity? get user => _preferences?.getString(_Keys.user) != null ? UserEntity.fromJson(jsonDecode(_preferences!.getString(_Keys.user)!)) : null;

  Future<void> setTodosIndex(int index) async => await _preferences?.setInt(_Keys.todosIndex, index);

  int? get todosIndex => _preferences?.getInt(_Keys.todosIndex);

  Future<void> removeTodosPage() async => await _preferences?.remove(_Keys.todosIndex);

  Future<void> saveTodos(TodosModel todosModel, int skip) async {
    for (int index=0; index < (todosModel.todos?.length ?? 0); index++) {
      await _preferences?.setString(_Keys.todo(skip), jsonEncode(todosModel.todos?[index].toJson()));
      skip++;
    }
     await setTodosIndex(skip);
  }

  Map<String, dynamic>? getTodos(int skip, int limit) {
    List<Map<String, dynamic>> todos = [];
    for (int index=skip; index < skip + limit; index++ ) {
      Map<String, dynamic>? res = _preferences?.getString(_Keys.todo(index)) != null ? jsonDecode(_preferences!.getString(_Keys.todo(index))!) : null;
      if (res != null) {
        todos.add(res);
      }
    }
    return {'todos' : todos};
  }

  Future<void> removeTodos() async {
    if (todosIndex != null) {
      for (int i = 0; i <= todosIndex!; i++) {
        if (_preferences?.containsKey(_Keys.todo(i)) ?? false) {
          await _preferences?.remove(_Keys.todo(i));
        }
      }
      await removeTodosPage();
    }
  }





  Future<void> clearAll() async {
    await removeToken();
    await removeUser();
    await removeTodos();
  }






// TODO: add your other variables
  // others functions
  /// ...
  
}

sealed class _Keys {
  static const String token = 'token';
  static const String locale = 'locale';
  static const String user = 'user';
  static String todo(int index) => 'todo$index';
  static const String todosIndex = 'todosIndex';
}
