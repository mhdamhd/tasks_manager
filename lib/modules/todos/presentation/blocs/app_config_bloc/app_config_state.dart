part of 'app_config_bloc.dart';

class AppConfigState extends Equatable {
  final AppLanguages language;
  final AppState appState;

  const AppConfigState({required this.language, required this.appState});

  @override
  List<Object> get props => [language, appState];
}