import 'package:tasksmanager/core/entities/base_entity.dart';

class UserEntity extends BaseEntity {
  final int id;
  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  UserEntity(
      {required this.id,
      required this.userName,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token});

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(
        id: int.parse(json['id']),
        userName: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        image: json['image'],
        token: json['token']);
  }

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['id'] = id.toString();
    map['username'] = userName;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    map['token'] = token;
    return map;
  }

  @override
  List<Object?> get props =>
      [id, userName, email, firstName, lastName, gender, image, token];
}
