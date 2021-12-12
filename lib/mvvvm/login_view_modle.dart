import 'dart:io';

import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/resources/models/login_request.dart';
import 'package:admin_panel/resources/models/register_request.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends ChangeNotifier {

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

  Future login(LoginRequest loginRequest) async {
    setLoading(true);
    try {
      _user = await Repository().login(
        loginRequest: LoginRequest(email: '',userPassword: ''),
      );
    } on MyException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = e.toString();
    }
    setLoading(false);
    notifyListeners();
  }

}