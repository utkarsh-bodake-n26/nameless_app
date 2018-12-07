import 'package:flutter/material.dart';

import 'package:nameless_app/pages/app_bar.dart';
import 'package:nameless_app/pages/app_body.dart';
import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/blocs/spaces_bloc.dart';

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

