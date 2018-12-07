import 'package:flutter/material.dart';

import 'package:nameless_app/pages/app_bar.dart';
import 'package:nameless_app/pages/app_body.dart';

class SpaceMainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar("Nameless"),
          AppBody()
        ],
      ),
    );
  }
}

