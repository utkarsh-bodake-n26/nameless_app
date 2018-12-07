
class SpacesState {

  final double mainBalance;
  final double savingBalance;
  final double travelBalance;
  final double giftBalance;

  SpacesState({
    this.mainBalance,
    this.savingBalance,
    this.travelBalance,
    this.giftBalance,
  });

  SpacesState.initial()
      : mainBalance = 1.1,
        savingBalance = 2.2,
        travelBalance = 3.3,
        giftBalance = 4.4;

  static SpacesState fromJSON(Map<String, double> data) {

    print('### $data');
    return SpacesState(
        mainBalance: data["mainBalance"],
        savingBalance: data["savingBalance"],
        travelBalance: data["travelBalance"],
        giftBalance: data["giftBalance"]
    );
  }

  @override
  String toString() => '''
    SpacesState {
      mainBalance: $mainBalance,
      savingBalance: $savingBalance,
      travelBalance: $travelBalance,
      giftBalance: $giftBalance
    }
  ''';
}

class SpaceState {
  final String id;
  final String name;
  final String balance;
  final String location;
  final String image;
  final String picture;

  const SpaceState({this.id, this.name, this.balance, this.location, this.image, this.picture});
}

List<SpaceState> spaces = [
  const SpaceState(
      id: "1",
      name: "Main space",
      balance: "10.0",
      location: "Your primary space",
      image: "assets/img/mars.png",
      picture: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg"
  ),
  const SpaceState(
      id: "2",
      name: "Saving Space",
      balance: "10.0",
      location: "Let's save some money",
      image: "assets/img/neptune.png",
      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg"
  ),
  const SpaceState(
      id: "3",
      name: "Travel Space",
      balance: "10.0",
      location: "Space to meet travel goals",
      image: "assets/img/moon.png",
      picture: "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg"
  ),
  const SpaceState(
      id: "4",
      name: "Gift Space",
      balance: "10.0",
      location: "Buy some gifts.",
      image: "assets/img/earth.png",
      picture: "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg"
  ),
];
