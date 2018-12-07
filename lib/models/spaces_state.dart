
class SpacesAPIState {

  final String mainBalance;
  final String savingBalance;
  final String travelBalance;
  final String giftBalance;

  SpacesAPIState({
    this.mainBalance,
    this.savingBalance,
    this.travelBalance,
    this.giftBalance,
  });

  SpacesAPIState.initial()
      : mainBalance = 'Loading balance...',
        savingBalance = 'Loading balance...',
        travelBalance = 'Loading balance...',
        giftBalance = 'Loading balance...';

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

