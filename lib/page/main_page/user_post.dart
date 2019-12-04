import 'package:flutter/material.dart';
import 'package:soad_app/models/auth.dart';
import '../../scoped-models/mainmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../subpages/indvpost.dart';

class UserPost extends StatefulWidget {
  List<dynamic> postList;

  UserPost(this.postList);

  @override
  State<StatefulWidget> createState() {
    return _UserPostState();
  }
}

class _UserPostState extends State<UserPost> {
  @override
  void initState() {
    // for (var i in widget.postList) {
    //   print(i.user);
    // }
    print("in init");
    print(widget.postList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                margin: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 20.0, bottom: 10.0),
                alignment: Alignment.center,
                child: model.Postlist == null
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                          "https://source.unsplash.com/random",
                                        ))),
                              ),
                              Text(model.Postlist[position]["name"] == null
                                  ? "Anonymous"
                                  : model.Postlist[position]["name"].toString())
                            ],
                          ),
                          Text(
                            model.Postlist[position]["date"]
                                .split("T")[0]
                                .toString(),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // Container(
                          //   height: 100,
                          //   child: ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: <Widget>[
                          //       ClipPath(
                          //         child: Image.network(
                          //           "https://source.unsplash.com/random",
                          //           alignment: Alignment(1.0, 1.0),
                          //         ),
                          //       ),
                          //       Text(
                          //         model.Postlist[position]["date"].substring(0,11).toString(),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Text(
                            model.Postlist[position]["text"].toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                              clipBehavior: Clip.hardEdge,
                              autofocus: true,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PostPage(model.Postlist[position]),
                                  ),
                                );
                              },
                              child: new Image.network(
                                "https://source.unsplash.com/random",
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              FlatButton.icon(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {},
                                color: Colors.blue,
                                label: Text(model
                                    .Postlist[position]["likes"].length
                                    .toString()),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.add_comment),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PostPage(model.Postlist[position]),
                                    ),
                                  );
                                },
                                color: Colors.pinkAccent,
                                label: Text(
                                    "Comments ${model.Postlist[position]["comments"].length.toString()}"),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: model.Postlist == null ? 10 : model.Postlist.length,
        );
      },
    );
  }
}
