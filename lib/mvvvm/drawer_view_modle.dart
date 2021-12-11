import 'package:admin_panel/ui/articles/articles_screen.dart';
import 'package:admin_panel/ui/gallery/gallery_screen.dart';
import 'package:admin_panel/ui/live_chat/live_chat_screen.dart';
import 'package:admin_panel/ui/online_news/online_news.dart';
import 'package:admin_panel/ui/wish_list/wish_list_screen.dart';
import 'package:flutter/material.dart';

class DrawerViewModel  with ChangeNotifier {
  int _index = 0;
  final screen = const [
    ArticlesScreen(),
    GalleryScreen(),
    LiveChatScreen(),
    WishListScreen(),
    OnlineNewsScreen(),
  ];
  final titles = [
    'articles',
    'live_chat',
    'gallery',
    'wish_list',
    'explore_online_news',
  ];

  DrawerViewModel();


  int get index => _index;

  void editScreen(int index) {
    _index = index;
    notifyListeners();
  }
}
