import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/dao/spaces_dao.dart';

class SpacesBloc {

  double mainBalance = 0.0;
  double savingBalance = 0.0;

  // input streams
  final BehaviorSubject<double> _mainBalanceStream = BehaviorSubject<double>();
  final BehaviorSubject<double> _savingBalanceStream = BehaviorSubject<double>();
  Sink<double> get _mainBalanceStreamSinkStream => _mainBalanceStream.sink;
  Sink<double> get _savingBalanceStreamSinkStream => _savingBalanceStream.sink;

  SpacesBloc() {

    _mainBalanceStream.stream.listen((double mainBalance) => this.mainBalance = mainBalance);
    _savingBalanceStream.stream.listen((double savingBalance) => this.savingBalance = savingBalance);

    // Runs every 1 second to update the timestamp
    Timer.periodic(Duration(seconds:1), (_) {

      SpacesDao.getSpaces().then((SpacesState data) {
          print('@@@ $data');
          _mainBalanceStream.add(data.mainBalance);
          _savingBalanceStream.add(data.savingBalance);
      });
    });
  }

  void dispose() {
    _mainBalanceStream.close();
    _savingBalanceStream.close();
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
