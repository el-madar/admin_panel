import 'dart:io';

import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/resources/models/login_request.dart';
import 'package:admin_panel/resources/models/register_request.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyAuth extends ChangeNotifier {

  bool _isLoading = false;
  late String _errorMessage;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(val){
    _errorMessage = val;
    notifyListeners();
  }

  User? _user;

  User? get user {
    return _user;
  }

  bool get isAuth {
    if (_user == null) {
      return false;
    } else {
      return _user?.userID != null;
    }
  }

  Future register(RegisterRequest registerRequest) async {
    setLoading(true);

    notifyListeners();
  }

  Future login(LoginRequest loginRequest) async {
    setLoading(true);

    notifyListeners();
  }


  void logout() async {
    notifyListeners();
  }


}
