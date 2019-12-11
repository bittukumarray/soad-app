import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/mainmodel.dart';
import '../widgets/ui_elements/logout_listile.dart';
import '../page/main_page/user_post.dart';
import '../page/main_page/notifications.dart';
import '../page/main_page/friend_contacts.dart';
import './testilepages/news.dart';
import './testilepages/userprofile.dart';

class HomePostPage extends StatefulWidget {
  final MainModel _model;

  HomePostPage(this._model);

  @override
  State<StatefulWidget> createState() {
    return _HomePostPageState();
  }
}

class _HomePostPageState extends State<HomePostPage> {
  // final AuthModel _model = AuthModel();

  @override
  void initState() {
    widget._model.getUserProfile(widget._model.user.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home Page"),
            actions: <Widget>[],
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home,
                  color: Colors.red[100],
                )),
                Tab(
                    icon: Icon(
                  Icons.group,
                  color: Colors.red[100],
                )),
                Tab(
                    icon: Icon(
                  Icons.notifications,
                  color: Colors.red[100],
                )),
                Tab(
                    icon: Icon(
                  Icons.message,
                  color: Colors.red[100],
                )),
              ],
            ),
          ),
          body: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return TabBarView(
                children: [
                  UserPost(widget._model.Postlist),
                  Icon(Icons.group),
                  Notifications(),
                  Contacts(),
                ],
              );
            },
          ),
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70, //20.0,
            child: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(widget._model.user.name),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? Colors.blue
                              : Colors.red,
                      child: Text(
                        widget._model.user.name[0].toUpperCase().toString(),
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ScopedModelDescendant(
                            builder: (BuildContext context, Widget child,
                                MainModel model) {
                              return UserProfilePage();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("New-Service"),
                    leading: Icon(Icons.new_releases),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ScopedModelDescendant(
                            builder: (BuildContext context, Widget child,
                                MainModel model) {
                              return NewsPage();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Friends"),
                    leading: Icon(Icons.people),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(),
                  LogoutListTile()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
