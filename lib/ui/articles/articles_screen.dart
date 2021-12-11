import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/mvvvm/articles_view_modle.dart';
import 'package:admin_panel/ui/articles/article_card_item.dart';
import 'package:admin_panel/ui/help_widget.dart';
import 'package:admin_panel/ui/widgets/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ArticlesViewModel(),
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          List<Articles> articles =
              (viewModel.articlesAssociatedPress + viewModel.articlesNextWeb);
          return viewModel.errors == null
              ? articles.isNotEmpty
                  ? ListView.builder(
                      itemCount: articles.length,
                      padding: const EdgeInsets.only(
                        top: paddingBig,
                        right: paddingBig,
                        left: paddingBig,
                      ),
                      itemBuilder: (context, index) {
                        return ArticleCardItem(article: articles[index]);
                      },
                    )
                  : const Center(child:  CircularProgressIndicator())
              : MessageScreen(title: viewModel.errors!, errors: true);
        },
      ),
    );
  }
}
