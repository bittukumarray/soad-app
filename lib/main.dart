import "package:flutter/material.dart";
import './page/auth.dart';
import 'package:scoped_model/scoped_model.dart';
import "./scoped-models/mainmodel.dart";
import './page/homepage.dart';
// import './page/subpages/indvpost.dart';

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
  final MainModel _model = MainModel();

  @override
  void initState() {
    _model.autoAuth();
    _model.getPost();
    _model.getGeneralnews();
    _model.getHealthnews();
    _model.getTechnologynews();
    _model.getSportsnews();
    _model.getEntertainmentnews();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          theme: ThemeData(
            backgroundColor: Colors.redAccent,
          ),
          routes: {
            '/': (BuildContext context) => ScopedModelDescendant(
                  builder:
                      (BuildContext context, Widget child, MainModel model) {
                    return _model.user == null
                        ? LoginScreen3()
                        : HomePostPage(_model);
                  },
                ),
            // 'post': (BuildContext context) => ScopedModelDescendant(
            //       builder:
            //           (BuildContext context, Widget child, MainModel model) {
            //         return PostPage();
            //       },
            //     ),
          },
        ));
  }
}
