import 'package:flutter/material.dart';

import 'package:nameless_app/blocs/spaces_bloc.dart';
import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/pages/space_details.dart';

class AppBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SpacesBloc spacesBloc = SpacesProvider.of(context);

    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: StreamBuilder<SpacesState>(
          initialData: spacesBloc.spacesState,
          stream: spacesBloc.spacesStateSubjectStream,
          builder: (BuildContext context, AsyncSnapshot<SpacesState> snapshot) {

            print ('####### zhali re setting: ${snapshot.data}');

            return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SpaceDetails(spaces[0]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SpaceDetails(spaces[1]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SpaceDetails(spaces[2]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SpaceDetails(spaces[3]),
                      ),
                    ],
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
