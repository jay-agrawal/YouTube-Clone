import 'package:flutter/material.dart';
import 'package:youtube/auth/first_screen.dart';

class AccountDetails extends StatelessWidget {
  static const routeName = '/account-detail';
  @override
  Widget build(BuildContext context) {
    List<Map> items = [
      {"name": "Your Channel", "icon": Icon(Icons.account_box)},
      {"name": "YouTube Studio", "icon": Icon(Icons.settings_input_svideo)},
      {"name": "Time watched", "icon": Icon(Icons.timelapse)},
      {"name": "Get Youtube Premium", "icon": Icon(Icons.trending_up)},
      {"name": "Paid Membership", "icon": Icon(Icons.card_membership)},
      {"name": "Switch Account", "icon": Icon(Icons.video_library)},
      {"name": "Turn on Incognito", "icon": Icon(Icons.personal_video)},
      {"name": "Your Data in YouTube", "icon": Icon(Icons.data_usage)},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Row(
              children: <Widget>[
                Text('Your Account'),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(FirstScreen.routeName);
            },
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}
