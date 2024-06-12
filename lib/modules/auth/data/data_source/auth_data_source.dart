import '../../domain/parameters/login_parameters.dart';
import '../../domain/parameters/register_parameters.dart';
import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> login(LoginParameters parameters);
  Future<UserModel> register(RegisterParameters parameters);
}
