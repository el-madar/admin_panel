import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/utils/strings.dart';

import 'api_provider.dart';

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
}
