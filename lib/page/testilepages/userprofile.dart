import 'package:flutter/material.dart';
import '../../scoped-models/mainmodel.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:link/link.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Profile Page"),
          ),
          body: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 15.0,
                      top: 20,
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                          "https://source.unsplash.com/random",
                        ),
                      ),
                    ),
                    alignment: FractionalOffset(0.5, 0.5),
                    // child: Text(
                    //   model.userProfile["user"]["name"] == null
                    //       ? ""
                    //       : model.userProfile["user"]["name"].toString(),
                    //   style: new TextStyle(
                    //     color: Colors.redAccent,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 30.0,
                    //   ),
                    // ),
                  ),
                  Container(
                    // color: Colors.grey[200],
                    alignment: FractionalOffset(0.5, 0.5),
                    child: Text(
                      model.userProfile["user"]["name"] == null
                          ? ""
                          : model.userProfile["user"]["name"].toString(),
                      style: new TextStyle(
                        color: Colors.green[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.grey[200],
                    alignment: FractionalOffset(0.5, 0.5),
                    child: Text(
                      model.userProfile["status"] == null
                          ? ""
                          : model.userProfile["status"].toString(),
                      style: new TextStyle(
                        color: Color.fromRGBO(32, 100, 120, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // color: Colors.grey[200],
                    alignment: FractionalOffset(0.5, 0.5),
                    child: Text(
                      "-----Experience Details-----",
                      style: new TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Title"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["experience"][0]["title"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Company"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["experience"][0]["company"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Location"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["experience"][0]["location"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Description"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["experience"][0]["description"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // color: Colors.grey[200],
                    alignment: FractionalOffset(0.5, 0.5),
                    child: Text(
                      "-----Education Details-----",
                      style: new TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("School"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["education"][0]["school"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Degree"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["education"][0]["degree"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Study Field"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["education"][0]["fieldofstudy"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.grey,
                    alignment: FractionalOffset(0, 0),
                    child: Row(
                      children: <Widget>[
                        Text("Description"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.userProfile["education"][0]["description"]
                              .toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
