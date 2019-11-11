import 'package:flutter/material.dart';
import 'package:soad_app/models/auth.dart';

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationsState();
  }
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: InkWell(
            onTap: () {
              print("object");
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Notification " +
                    position.toString() +
                    ". \nThis is a big notification just to check it",
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
