/// class [ApisUrls] contains all URLs to external services, services,
/// or APIs, according to the following figure
///
/// add new APIs URL in this way:
/// EX: static const String {verb}featureName = '$_baseApiUrl/{route}';

class ApisUrls {
  /// [_baseUrl] base server url
  static const String _baseUrl = 'https://dummyjson.com';

  /// Auth Feature APIs
  static const String login = '$_baseUrl/auth/login';

  static String getTodos(String parameters) => '$_baseUrl/todos$parameters';
  static const String addTodo = '$_baseUrl/todos/add';
  static String updateTodo(int id) => '$_baseUrl/todos/$id';
  static String deleteTodo(int id) => '$_baseUrl/todos/$id';
}
