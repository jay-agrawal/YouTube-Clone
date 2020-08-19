import 'package:flutter/material.dart';
import 'package:youtube/naviagtionpages/explore.dart';
import 'package:youtube/naviagtionpages/home.dart';
import 'package:youtube/naviagtionpages/library.dart';
import 'package:youtube/naviagtionpages/notifications.dart';
import 'package:youtube/naviagtionpages/subscriptions.dart';
import 'package:youtube/Screens/account_details.dart';

class YoutubeHome extends StatefulWidget {
  @override
  _YoutubeHomeState createState() => _YoutubeHomeState();
}

class _YoutubeHomeState extends State<YoutubeHome> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Explore(),
    Subscriptions(),
    Notifications(),
    Library(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          'assets/youtube_logo.png',
          height: 60,
          width: 105,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.videocam,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.account_circle,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AccountDetails.routeName,
                );
              }),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 52,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              title: Text('Subscriptions'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('Library'),
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.red,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
