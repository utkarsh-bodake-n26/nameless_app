import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/dao/spaces_dao.dart';


class SpacesBloc {

  SpacesState spacesState = SpacesState.initial();

  //output stream
  final BehaviorSubject<SpacesState> _spacesStateSubject = BehaviorSubject<SpacesState>();
  Stream<SpacesState> get spacesStateSubjectStream => _spacesStateSubject.stream;

  SpacesBloc() {

    // Runs every 1 second to update the timestamp
    Timer.periodic(Duration(seconds:1), (_) {

      SpacesDao.getSpaces().then((SpacesState data) {
//          print('@@@ $data');
          _spacesStateSubject.add(data);
      });
    });
  }

  void dispose() {
  }
}

class SpacesProvider extends InheritedWidget {
  final SpacesBloc spacesBloc;

  SpacesProvider(
      {Key key, @required SpacesBloc spacesBloc, @required Widget child})
      : this.spacesBloc = spacesBloc ?? SpacesBloc(),
        super(key: key, child: child);

  static SpacesBloc of(BuildContext context) {
    SpacesProvider spacesProvider =
    (context.inheritFromWidgetOfExactType(SpacesProvider) as SpacesProvider);
    return spacesProvider.spacesBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
