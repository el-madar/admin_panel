import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/resources/repository.dart';
import 'package:admin_panel/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ArticlesViewModel  with ChangeNotifier {
  List<Articles> articlesAssociatedPress = [];
  List<Articles> articlesNextWeb = [];
  String? errors;


  ArticlesViewModel() {
    getArticlesTheNextWeb ();
    getArticlesAssociatedPress ();
  }

  void getArticlesTheNextWeb () async {
    try {
      // articlesNextWeb = await Repository().getArticles('the-next-web');
    } on MyException catch (e) {
      // errors = e.messages;
    } catch (e) {
      errors = tr('try_again_later');
    }
    notifyListeners();
  }


  void getArticlesAssociatedPress () async {
    try {
      // articlesNextWeb = await Repository().getArticles('associated-press');
    } on MyException catch (e) {
      // errors = e.messages;
    } catch (e) {
      errors = tr('try_again_later');
    }
    notifyListeners();
  }



}
