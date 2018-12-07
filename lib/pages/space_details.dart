import 'package:flutter/material.dart';

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/pages/seperator.dart';
import 'package:nameless_app/pages/text_style.dart';

class SpaceDetails extends StatelessWidget {

  final SpaceState spaceState;
  final bool horizontal;

  SpaceDetails(this.spaceState, {this.horizontal = true});

  SpaceDetails.vertical(this.spaceState): horizontal = false;

  @override
  Widget build(BuildContext context) {

    final spaceThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
          vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "planet-hero-${spaceState.id}",
        child: new Image(
          image: new AssetImage(spaceState.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final spaceCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(spaceState.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(spaceState.balance, style: Style.balanceTextStyle),
          new Container(height: 4.0),
          new Text(spaceState.location, style: Style.commonTextStyle),
        ],
      ),
    );


    final spaceCard = new Container(
      child: spaceCardContent,
      height: horizontal ? 130.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: new Stack(
        children: <Widget>[
          spaceCard,
          spaceThumbnail,
        ],
      ),
    );
  }
}
