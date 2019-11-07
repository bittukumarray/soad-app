import 'package:flutter/material.dart';

class Login {
  final String username;
  final String password;

  Login({@required this.username, @required this.password});
}


class Signup {
  final String name;
  final String email;
  final String password;
  final String confirmpassword;

  Signup({@required this.name, @required this.email, @required this.password, @required this.confirmpassword});

}