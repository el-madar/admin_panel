import 'dart:convert';

import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/model/user.dart';
import 'package:admin_panel/utils/end_boints.dart';
import 'package:admin_panel/utils/strings.dart';

import 'api_provider.dart';
import 'models/login_request.dart';

class Repository {
  final apiProvider = ApiProvider();

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

    return userFromJson(responseData['user']);
  }
}
