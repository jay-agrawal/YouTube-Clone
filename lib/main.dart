import 'package:flutter/material.dart';
import 'package:youtube/Screens/account_details.dart';
import 'package:youtube/auth/first_screen.dart';
import 'package:youtube/auth/login_page.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'YouTube';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LoginPage(),
      routes: {
        AccountDetails.routeName: (context) => AccountDetails(),
        FirstScreen.routeName: (context) => FirstScreen(),
      },
    );
  }
}
