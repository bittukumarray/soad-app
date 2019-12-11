import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/mainmodel.dart';

class PostPage extends StatefulWidget {
  int  index;

  PostPage(this.index);

  @override
  State<StatefulWidget> createState() {
    return _PostPageState();
  }
}

class _PostPageState extends State<PostPage> {
  TextEditingController _commentController = new TextEditingController();
  Map<dynamic, dynamic> commentinfo;

  Widget commentBulid(List comments) {
    return Column(
      children: comments
          .map(
            (comment) => Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      color: Colors.grey,
                      child: Text(
                        comment['name'],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 500,
                      child: Text(
                        comment['text'],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Post"),
            actions: <Widget>[],
          ),
          body: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 15.0,
                    ),
                    margin: EdgeInsets.only(
                      left: 10.0,
                    ),
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                          "https://source.unsplash.com/random",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    model.Postlist[widget.index]["name"] == null
                        ? "Anonymous"
                        : model.Postlist[widget.index]["name"].toString(),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15.0,
                ),
                margin: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Text(
                  model.Postlist[widget.index]["date"].split("T")[0].toString(),
                ),
              ),
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
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                      "https://source.unsplash.com/random",
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 5.0,
                  right: 10.0,
                ),
                margin: EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                  top: 20,
                ),
                child: FlatButton.icon(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                  color: Colors.blue,
                  label: Text(model.Postlist[widget.index]["likes"].length.toString()),
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Text("Comments "),
                  commentBulid(model.Postlist[widget.index]["comments"]),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Comment here",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      controller:_commentController,
                      validator: (val) {
                        if (val.length > 0) {
                            return "Comment length should be greater than 0";
                        }
                        return "0";
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 5.0,
                      right: 10.0,
                    ),
                    margin: EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                      top: 20,
                    ),
                    child: FlatButton.icon(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () async {

                        commentinfo = await model.postcomment(
                            model.Postlist[widget.index]["_id"],
                            model.user.token,
                            model.user.avatar,
                            model.user.name,
                            _commentController.text);
                        if (commentinfo.containsKey("status")) {
                         model.getPost();
                          // PostPage(widget.post);
                        }
                      },
                      color: Colors.redAccent,
                      label: Text("Comment"),
                    ),
                  ),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
