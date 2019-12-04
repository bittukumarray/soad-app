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
            child: ListTile(
              leading: ClipRRect(
                borderRadius: new BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/nature.jpeg',
                  alignment: Alignment.centerLeft,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Notification " +
                      position.toString() +
                      ". \nThis is a big notification just to check it",
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
