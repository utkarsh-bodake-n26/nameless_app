import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:nameless_app/models/spaces_state.dart';
import 'package:nameless_app/constants/constants.dart' as constants;

class SpacesDao {
  static final http.Client _httpClient = http.Client();
  static final String _spacesAPI = '${constants.spacesAPI}';

  static Future<SpacesAPIState> getSpaces() async {
    return _httpClient
        .get(Uri.parse('$_spacesAPI'))
        .then((res) => res.body)
        .then(json.decode)
        .then((data) => SpacesAPIState(
              mainBalance: data["main"].toString(),
              savingBalance: data["saving"].toString(),
              travelBalance: data["travel"].toString(),
              giftBalance: data["gift"].toString()
          ))
        .catchError((error) => SpacesAPIState.initial());
  }
}
