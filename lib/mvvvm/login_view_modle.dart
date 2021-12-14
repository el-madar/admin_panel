import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/resources/models/login_request.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:flutter/material.dart';


class LoginController extends ChangeNotifier {

  bool _isLoading = false;
  late String _errorMessages = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessages;

  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setMessages(val){
    _errorMessages = val;
    notifyListeners();
  }

  void resetMessages(){
    _errorMessages = '';
    notifyListeners();
  }

  User? _user;

  User? get user {
    return _user;
  }

  Future login(LoginRequest loginRequest) async {
    setLoading(true);
    resetMessages();
    try {
      _user = await Repository().login(
        loginRequest: loginRequest,
      );
      await Repository().loginOfLine(user: _user!);
    } on MyException catch (e) {
      // join convert last to String Add Add String sam \n  or other , -
      setMessages(e.messages.join('\n'));
    } catch (e) {
      setMessages(e.toString());
    }
    setLoading(false);
  }

}
