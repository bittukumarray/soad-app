import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/auth.dart';
import '../widgets/ui_elements/logout_listile.dart';
import '../page/main_page/user_post.dart';
import '../page/main_page/notifications.dart';

class HomePostPage extends StatefulWidget {
  final AuthModel model;

  HomePostPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePostPageState();
  }
}

class _HomePostPageState extends State<HomePostPage> {
  // final AuthModel _model = AuthModel();

  @override
  void initState() {
    // _model.autoAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(
          children: [
            UserPost(),
            Icon(Icons.group),
            Notifications(),
            Icon(Icons.message),
          ],
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70, //20.0,
          child: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(widget.model.user.name),
                  accountEmail: Text(widget.model.user.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.blue
                            : Colors.red,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Profile"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text("Item 2"),
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
  }
}
