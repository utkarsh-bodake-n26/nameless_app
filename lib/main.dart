import 'package:flutter/material.dart';

import 'package:nameless_app/dao/spaces_dao.dart';
import 'package:nameless_app/blocs/spaces_bloc.dart';
import 'package:nameless_app/pages/space_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SpacesProvider(
      spacesBloc: SpacesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nameless App',
        home: SpaceMainPage(),
      ),
    );
  }
}
