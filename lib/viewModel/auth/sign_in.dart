import 'package:coding_game/backendService/auth/sign_in.dart';
import 'package:coding_game/model/auth/sign_in.dart';
import 'package:flutter/material.dart';

class SingnInProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  SignInModel? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  SignInModel? get user => _user;

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _user = null;
    notifyListeners();

    try {
      final response = await SignInService().signInUser(
        email: email,
        password: password,
      );

      _user = response;
    } catch (e) {
      _errorMessage = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}
