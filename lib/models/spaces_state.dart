
class SpacesAPIState {

  final double mainBalance;
  final double savingBalance;
  final double travelBalance;
  final double giftBalance;

  SpacesAPIState({
    this.mainBalance,
    this.savingBalance,
    this.travelBalance,
    this.giftBalance,
  });

  SpacesAPIState.initial()
      : mainBalance = 1.1,
        savingBalance = 2.2,
        travelBalance = 3.3,
        giftBalance = 4.4;

  static SpacesAPIState fromJSON(Map<String, double> data) {

    print('### $data');
    return SpacesAPIState(
        mainBalance: data["main"],
        savingBalance: data["saving"],
        travelBalance: data["travel"],
        giftBalance: data["gift"]
    );
  }

  @override
  String toString() => '''
    SpacesAPIState {
      mainBalance: $mainBalance,
      savingBalance: $savingBalance,
      travelBalance: $travelBalance,
      giftBalance: $giftBalance
    }
  ''';
}

class SpaceState {
  String id;
  String name;
  String balance;
  String location;
  String image;
  String picture;

  SpaceState({this.id, this.name, this.balance, this.location, this.image, this.picture});

  @override
  String toString() => '''
    SpaceState {
      id: $id,
      name: $name,
      balance: $balance,
    }
  ''';
}

