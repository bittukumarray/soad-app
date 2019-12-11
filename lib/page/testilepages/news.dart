import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/mainmodel.dart';
// import '../widgets/ui_elements/logout_listile.dart';
// import '../page/main_page/user_post.dart';
// import '../page/main_page/notifications.dart';
// import '../page/main_page/friend_contacts.dart';
import './entertainment.dart';
import './healthnews.dart';
import './sportsnews.dart';
import './technologynews.dart';
import './generalnews.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends State<NewsPage> {
  // final AuthModel _model = AuthModel();

  @override
  void initState() {
    // widget._model.getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text("News Page"),
              actions: <Widget>[],
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  new Container(
                    width: 150,
                    child: new Tab(
                      text: "General",
                    ),
                  ),
                  new Container(
                    width: 150,
                    child: Tab(
                      text: "Health",
                    ),
                  ),
                  new Container(
                    width: 150,
                    child: Tab(
                      text: "Technology",
                    ),
                  ),
                  new Container(
                    width: 150,
                    child: Tab(
                      text: "Sports",
                    ),
                  ),
                  new Container(
                    width: 150,
                    child: Tab(
                      text: "Entertainment",
                    ),
                  ),
                ],
              ),
            ),
            body: ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return TabBarView(
                  children: [
                    Generalnews(model.generalnews),
                    Healthnews(model.healthnews),
                    Technologynews(model.technologynews),
                    Sportsnews(model.sportsnews),
                    Entertainmentnews(model.entertainmentnews),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
