import 'dart:convert';

import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/utils/end_boints.dart';
import 'package:admin_panel/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider.dart';
import 'models/login_request.dart';

class Repository {
  final apiProvider = ApiProvider();

  // final databaseHelper = DatabaseHelper();
  static User? user;

  static SharedPreferences? preferences;

  /////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////
  Repository._privateConstructor();

  static final Repository _instance = Repository._privateConstructor();

  factory Repository() {
    return _instance;
  }

  /////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////
  Future<List<Articles>> getArticles(String source) async {
    var data = await apiProvider.getRequestAPI(
      url: '${baseURL}articles?source=$source&apiKey=$apiKey',
    );
    return articlesFromJson(data);
  }

  Future<User> login({required LoginRequest loginRequest}) async {
    var responseData = await apiProvider.postRequestAPI(
      url: EP_login,
      headers: {},
      body: json.encode(loginRequest.toJson()),
    );
    User user = User.fromJson(responseData['user']);
    return user;
  }

  ///////////////////////////////////// data base
  Future<bool> loginOfLine({required User user}) async {
    bool done = await preferences!.setString(
      'user_login',
      jsonEncode(user.toJson()),
    );
    return done;
  }

  Future<User?> getLoginUser() async {
    String? data = preferences!.getString('user_login');
    if (data != null) {
      Map<dynamic, dynamic> userData = jsonDecode(data);
      user = User.fromJson(userData);
      return user;
    }
    return null;
  }

  Future<bool> logoutOfLine() async {
    bool done = await preferences!.remove('user_login');
    user = null;
    return done;
  }
}
