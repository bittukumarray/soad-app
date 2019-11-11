import 'package:flutter/material.dart';

class Login {
  final String username;
  final String password;

  Login({@required this.username, @required this.password});
}


class User {
  final String name;
  final String email;
  final String token;
  final String id;
  final String avatar;
  

  User({@required this.name, @required this.id, @required this.token, @required this.avatar, @required this.email});

}