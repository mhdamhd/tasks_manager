import 'package:tasksmanager/core/models/base_model.dart';
import 'package:tasksmanager/modules/auth/domain/entities/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  UserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.refreshToken,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  num? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    return map;
  }

  @override
  UserEntity toEntity() {
    return UserEntity(
      id: id?.toInt() ?? -1,
      userName: username ?? '',
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      gender: gender ?? '',
      image: image ?? '',
      token: token ?? '',
    );
  }
}
