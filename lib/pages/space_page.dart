import 'package:flutter/material.dart';

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/blocs/spaces_bloc.dart';

class SpaceMainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SpacesBloc spacesBloc = SpacesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nameless App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
//                getTransactionWidget(statsBloc),
                SizedBox(height: 30.0),
                Divider(color: Colors.teal),
                SizedBox(height: 30.0),
//                getStatsResponseWidget(statsBloc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}