class SignInModel {
  String playerName;
  String email;
  String accessToken;
  String tokenType;

  SignInModel({
    required this.playerName,
    required this.email,
    required this.accessToken,
    required this.tokenType,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      playerName: json['player_name'],
      email: json['email'],
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}
