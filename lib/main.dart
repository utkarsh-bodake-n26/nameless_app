import 'package:flutter/material.dart';

import 'package:nameless_app/pages/space_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nameless app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpaceMainPage(),
    );
  }
}
