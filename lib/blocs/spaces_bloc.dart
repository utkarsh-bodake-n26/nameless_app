import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/dao/spaces_dao.dart';


class SpacesBloc {

  SpacesAPIState spacesAPIState = SpacesAPIState.initial();
  List<SpaceState> spaces = [
    SpaceState(
        id: "1",
        name: "Main space",
        balance: "10.0",
        location: "Your primary space",
        image: "assets/img/mars.png",
        picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
    ),
    SpaceState(
        id: "2",
        name: "Saving Space",
        balance: "10.0",
        location: "Let's save some money",
        image: "assets/img/neptune.png",
        picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
    ),
    SpaceState(
        id: "3",
        name: "Travel Space",
        balance: "10.0",
        location: "Space to meet travel goals",
        image: "assets/img/moon.png",
        picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
    ),
    SpaceState(
        id: "4",
        name: "Gift Space",
        balance: "10.0",
        location: "Buy some gifts.",
        image: "assets/img/earth.png",
        picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
    ),
  ];

  //output stream
  final BehaviorSubject<List<SpaceState>> _spacesStateSubject = BehaviorSubject<List<SpaceState>>();
  Stream<List<SpaceState>> get spacesStateSubjectStream => _spacesStateSubject.stream;

  SpacesBloc() {

    // Runs every 1 second to update the timestamp
    Timer.periodic(Duration(seconds:1), (_) {

      SpacesDao.getSpaces().then((SpacesAPIState data) {
//          print('@@@ $data');
        spaces[0].balance = data.mainBalance.toString();
        spaces[1].balance = data.savingBalance.toString();
        spaces[2].balance = data.travelBalance.toString();
        spaces[3].balance = data.giftBalance.toString();
          _spacesStateSubject.add(spaces);
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
