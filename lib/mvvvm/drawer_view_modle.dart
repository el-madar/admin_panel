import 'package:admin_panel/ui/articles/articles_screen.dart';
import 'package:admin_panel/ui/drawer/drawer_model.dart';
import 'package:admin_panel/ui/gallery/gallery_screen.dart';
import 'package:admin_panel/ui/live_chat/live_chat_screen.dart';
import 'package:admin_panel/ui/online_news/online_news.dart';
import 'package:admin_panel/ui/wish_list/wish_list_screen.dart';
import 'package:flutter/material.dart';

class DrawerViewModel with ChangeNotifier {
  late ValueNotifier<bool> isExtended = ValueNotifier(false);

  final List<DrawerModel> screens = [
    DrawerModel(
      screen: const ArticlesScreen(),
      icon: Icons.home,
      title: 'articles',
      index: 0,
    ),
    DrawerModel(
      screen: const GalleryScreen(),
      icon: Icons.home,
      title: 'live_chat',
      index: 1,
    ),
    DrawerModel(
      screen: const OnlineNewsScreen(),
      icon: Icons.home,
      title: 'gallery',
      index: 2,
    ),
    DrawerModel(
      screen: const LiveChatScreen(),
      icon: Icons.home,
      title: 'wish_list',
      index: 3,
    ),
    DrawerModel(
      screen: const WishListScreen(),
      icon: Icons.home,
      title: 'explore_online_news',
      index: 4,
    ),
  ];

  late DrawerModel _selected = screens.first;

  DrawerViewModel() {
    _selected = screens.first;
  }

  DrawerModel get selected => _selected;

  void editScreen(int index) {
    _selected = screens[index];
    notifyListeners();
  }
}
