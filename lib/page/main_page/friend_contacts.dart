import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/chat_model.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsState();
  }
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return new Column(
      children: <Widget>[
        new Padding(padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 8.0)),
        new Expanded(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: (){},
                      child: new Card(
                        elevation: 1.0,
                        color: const Color(0xFFFFFFFF),
                        child: new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new CachedNetworkImageProvider(
                                ChatMockData[position].imageUrl),
                          ),
                          title: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(
                                ChatMockData[position].name,
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold),
                              ),
                              new Text(
                                ChatMockData[position].time,
                                style: new TextStyle(
                                    color: Colors.grey, fontSize: 14.0),
                              ),
                            ],
                          ),
                          subtitle: new Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: new Text(
                              ChatMockData[position].message,
                              style: new TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                    ));
              },
              itemCount: ChatMockData.length),
        )
      ],
    );
  }
}
