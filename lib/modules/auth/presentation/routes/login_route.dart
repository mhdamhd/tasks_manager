import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksmanager/core/services/service_locator.dart';
import 'package:tasksmanager/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:tasksmanager/modules/auth/presentation/screens/login_screen.dart';

class LoginRoute {
  static const String name = '/login';

  static GoRoute route = GoRoute(
    path: name,
    builder: (context, state) => BlocProvider(
        create: (context) => sl<LoginBloc>(), child: LogInScreen()),
  );
}
