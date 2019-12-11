import 'package:flutter/material.dart';
import '../../scoped-models/mainmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:link/link.dart';

class UserProfilePage extends StatefulWidget {
  final List<dynamic> sportsPost;
  UserProfilePage(this.sportsPost);

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
                child: widget.sportsPost == null
                    ? CircularProgressIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.sportsPost[position]["title"].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(widget.sportsPost[position]["publishedAt"]
                              .toString()),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              widget.sportsPost[position]["description"] == null
                                  ? "Description not found!"
                                  : widget.sportsPost[position]["description"]
                                      .toString(),
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                              clipBehavior: Clip.hardEdge,
                              autofocus: true,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         PostPage(position),
                                //   ),
                                // );
                              },
                              child: widget.sportsPost[position]
                                          ["urlToImage"] ==
                                      null
                                  ? Text("Image not found!")
                                  : new Image.network(
                                      widget.sportsPost[position]["urlToImage"],
                                      fit: BoxFit.fill,
                                    )),
                          Container(
                            padding: EdgeInsets.all(10),
                            child:
                                widget.sportsPost[position]["content"] == null
                                    ? Text("Content not found!")
                                    : Text(
                                        widget.sportsPost[position]["content"],
                                        style: TextStyle(color: Colors.black),
                                      ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              widget.sportsPost[position]["author"] == null
                                  ? "By : Anonymous"
                                  : "By : ${widget.sportsPost[position]["author"]}",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          widget.sportsPost[position]["url"] == null
                              ? Text("")
                              : Link(
                                  child: Text(
                                    widget.sportsPost[position]["source"]
                                        ["name"],
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  url: widget.sportsPost[position]["url"],
                                  onError: () {},
                                ),
                        ],
                      ),
              ),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: widget.sportsPost == null ? 10 : widget.sportsPost.length,
        );
      },
    );
  }
}
