import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {"name": "History", "icon": Icon(Icons.history)},
      {"name": "Downloads", "icon": Icon(Icons.file_download)},
      {"name": "Your Videos", "icon": Icon(Icons.video_library)},
      {"name": "Purchases", "icon": Icon(Icons.account_balance_wallet)},
      {
        "name": "Watch Later",
        "icon": Icon(Icons.watch_later),
        "extra": "25 unwatched videos"
      },
    ];

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: items
            .map(
              (i) => ListTile(
                leading: i["icon"],
                title: i["extra"] == null
                    ? Text(i["name"])
                    : Row(
                        children: <Widget>[
                          Text(i["name"]),
                          Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              i["extra"],
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
              ),
            )
            .toList(),
      ),
    );
  }
}
