import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  static List<Map> items = [
    {
      "title": "How to Code in Python",
      "subtitle": "30 min ago",
    },
    {
      "title": "How to build in Java",
      "subtitle": "40 min ago",
    },
    {
      "title": "How to Code in C++",
      "subtitle": "50 min ago",
    },
    {
      "title": "How to Make apps using flutter",
      "subtitle": "10 min ago",
    },
    {
      "title": "How to Do it in right way",
      "subtitle": "15 min ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: items
            .map(
              (i) => ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                dense: true,
                leading: CircleAvatar(
                  child: Icon(Icons.account_circle),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(i["title"]),
                ),
                subtitle: Text(i["subtitle"]),
                trailing: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Icon(Icons.more_vert)),
              ),
            )
            .toList(),
      ),
    );
  }
}
