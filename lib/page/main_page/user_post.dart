import 'package:flutter/material.dart';
import 'package:soad_app/models/auth.dart';

class UserPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserPostState();
  }
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              position.toString(),
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}
