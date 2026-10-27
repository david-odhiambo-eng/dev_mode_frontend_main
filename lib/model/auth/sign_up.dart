class SignInModel {
  String playerName;

  SignInModel({required this.playerName});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(playerName: json['player_name']);
  }
}
