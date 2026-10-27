import 'package:coding_game/backendService/auth/sign_up.dart';
import 'package:coding_game/model/auth/sign_up.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final SignUpService _signUpService = SignUpService();

  bool _isLoading = false;
  String? _errorMessage;
  SignInModel? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  SignInModel? get user => _user;

  Future<void> signUpUser({
    required String playerName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _user = null;
    notifyListeners();

    try {
      final response = await _signUpService.signUpUser(
        playerName: playerName,
        email: email,
        password: password,
      );

      _user = response;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
