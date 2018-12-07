
class SpacesState {

  final double mainBalance;
  final double savingBalance;

  SpacesState({
    this.mainBalance,
    this.savingBalance,
  });

  SpacesState.initial()
      : mainBalance = 1.1,
        savingBalance = 2.2;

  static SpacesState fromJSON(Map<String, double> data) {

    print('### $data["mainBalance"]');
    return SpacesState(
        mainBalance: data["mainBalance"],
        savingBalance: data["savingBalance"],
    );
  }

  @override
  String toString() => '''
    SpacesState {
      mainBalance: $mainBalance,
      savingBalance: $savingBalance,
    }
  ''';
}

//class SpacesState {
//
//  final List<SpaceBalanceEntity> spaces;
//
//  SpacesState({
//    this.spaces,
//  });
//
//  SpacesState.initial()
//      : spaces = [];
//
//  static SpacesState fromJSON(Map<String, dynamic> data) {
//
//    return SpacesState(
//        sum: data["sum"],
//        avg: data["avg"],
//        max: data["max"],
//        min: data["min"],
//        count: data["count"]
//    );
//  }
//
//  @override
//  String toString() => '''
//    SpacesState {
//      spaces: $spaces,
//    }
//  ''';
//}

class SpaceBalanceEntity {

  final String name;
  final double balance;

  SpaceBalanceEntity({
    this.name,
    this.balance
  });

  SpaceBalanceEntity.initial()
      : name = "",
        balance = 0.0;

  static SpaceBalanceEntity fromJSON(Map<String, dynamic> data) {
    return SpaceBalanceEntity(
        name: data["name"],
        balance: data["balance"],
    );
  }

  @override
  String toString() => '''
    Statistics {
      name: $name,
      balance: $balance,
    }
  ''';
}
