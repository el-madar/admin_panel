import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/ui/articles/article_card_item.dart';
import 'package:admin_panel/ui/help_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Articles article;

  const ArticleDetailsScreen({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('article_details')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingBig),
        child: Column(
          children: [
            ArticleCardItem(
              article: article,
              viewType: 2,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  launch(article.url);
                },
                child: Text(tr('open_website')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
