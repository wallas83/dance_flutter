
import '../image_asset.dart';

class LastPlayedGame {
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  const LastPlayedGame({this.name, this.hoursPlayed, this.imagePath, this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(name: "waka waka", hoursPlayed: 10, gameProgress: 0.20, imagePath: game_assassin),
  LastPlayedGame(name: "Caporal", hoursPlayed: 50, gameProgress: 0.80, imagePath: game_dead_cells),
  LastPlayedGame(name: "pujllay", hoursPlayed: 90, gameProgress: 0.95, imagePath: game_stardew),
  LastPlayedGame(name: "cueaca", hoursPlayed: 3, gameProgress: 0.10, imagePath: game_no_mans_sky),
];

final popularWithFriends = [
  game_fortnite, game_apex, game_pubg
];

final tipo =[
  "waka waka", "caporal","cueca"
];

final subTipo =[
  "0.20", "0.80","0.95"
];

final popularAnimation = [
  banner_flare,banner_flare,banner_flare
];
