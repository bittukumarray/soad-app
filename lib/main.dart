import "package:flutter/material.dart";
import './page/auth.dart';
import 'package:scoped_model/scoped_model.dart';
import "./scoped-models/auth.dart";

main(){

  runApp(MyApp());

}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}


class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    final AuthModel model = AuthModel();
    return ScopedModel<AuthModel>(
      model: model,
      child: MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.black,
      ),
      home: LoginScreen3()));
  }
}