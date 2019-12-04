import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped-models/mainmodel.dart';

class PostPage extends StatefulWidget {
  final Map<dynamic, dynamic> post;

  PostPage(this.post);

  @override
  State<StatefulWidget> createState() {
    return _PostPageState();
  }
}

class _PostPageState extends State<PostPage> {
  Widget commentBulid(List comments) {
    return Column(
      children: comments
          .map(
            (comment) => Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
              initialValue: comment["text"],
              enabled: false,
              decoration: new InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                enabled: false,
              
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              validator: (val) {
                return "0";
              },
              keyboardType: TextInputType.text,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
              
            ),),
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
                    widget.post["name"] == null
                        ? "Anonymous"
                        : widget.post["name"].toString(),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15.0,
                ),
                margin: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Text(
                  widget.post["date"].split("T")[0].toString(),
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
                  label: Text(widget.post["likes"].length.toString()),
                ),
              ),
              Container(
                child: Column(
                children: <Widget>[
                  Text("Comments "),
                  commentBulid(widget.post["comments"]),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Comment here",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      return "0";
                    },
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
