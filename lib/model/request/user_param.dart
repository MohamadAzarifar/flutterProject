import 'package:meta/meta.dart';

class UserParam {
  final String email;
  final String password;

  UserParam({@required this.email, @required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'zipcode': password,
  };
}