import 'package:tasksmanager/core/services/cache_storage_services.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksmanager/modules/auth/presentation/routes/login_route.dart';
import 'package:tasksmanager/modules/todos/presentation/screens/todos_screen.dart';

class TodosRoute {
  static const String name = '/home';
  static GoRoute route = GoRoute(
    path: name,
    redirect: (context, state) {
      if (!CacheStorageServices().hasToken) return LoginRoute.name;
      return null;
    },
    builder: (context, state) => TodosScreen(),
  );
}
