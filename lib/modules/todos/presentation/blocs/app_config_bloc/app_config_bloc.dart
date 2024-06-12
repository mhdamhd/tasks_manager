import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksmanager/core/enums/app_languages.dart';
import 'package:tasksmanager/core/enums/app_state.dart';
import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:tasksmanager/core/translations/app_local.dart';

part 'app_config_state.dart';
part 'app_config_event.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {

  AppConfigBloc()
      : super(AppConfigState(language: AppLocale().currentLanguage(), appState: CacheStorageServices().hasToken ? AppState.loggedIn : AppState.loggedOut)) {
    on<ChangeLanguageEvent>(_setLanguage);
    on<LogInEvent>(_logIn);
    on<LogOutEvent>(_logOut);
  }

  FutureOr<void> _setLanguage(ChangeLanguageEvent event, emit) async {
    await AppLocale().setLocale(event.language);
    emit(AppConfigState(language: AppLocale().currentLanguage(), appState: state.appState));
  }

  FutureOr<void> _logIn(LogInEvent event, emit) async {
    emit(AppConfigState(language: AppLocale().currentLanguage(), appState: AppState.loggedIn));
  }

  FutureOr<void> _logOut(LogOutEvent event, emit) async {
    await CacheStorageServices().clearAll();
    emit(AppConfigState(language: AppLocale().currentLanguage(), appState: AppState.loggedOut));
  }
}
