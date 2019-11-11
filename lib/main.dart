import "package:flutter/material.dart";
import './page/auth.dart';
import 'package:scoped_model/scoped_model.dart';
import "./scoped-models/auth.dart";
import './page/homepage.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final AuthModel _model = AuthModel();

  @override
  void initState() {
    _model.autoAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
        model: _model,
        child: MaterialApp(
          theme: ThemeData(
            backgroundColor: Colors.redAccent,
          ),
          routes: {
            '/': (BuildContext context) => ScopedModelDescendant(
                  builder:
                      (BuildContext context, Widget child, AuthModel model) {
                    return _model.user == null
                        ? LoginScreen3()
                        : HomePostPage(_model);
                  },
                )
          },
        ));
  }
}
