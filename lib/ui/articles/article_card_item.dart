import 'package:admin_panel/model/articles.dart';
import 'package:admin_panel/ui/articles/published_date_widget.dart';
import 'package:admin_panel/ui/articles_details/articles_details_screen.dart';
import 'package:admin_panel/utils/images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../help_widget.dart';

class ArticleCardItem extends StatelessWidget {
  final Articles article;
  final int viewType;

  const ArticleCardItem({Key? key, required this.article, this.viewType = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: paddingBig),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                article.urlToImage != null
                    ? CachedNetworkImage(
                        fit: BoxFit.fill,
                        // width: double.maxFinite,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(paddingBig),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Theme.of(context).errorColor,
                          size: 40,
                        ),
                        imageUrl: article.urlToImage!,
                      )
                    : Image.asset(
                        imagePlaceholder,
                        fit: BoxFit.fill,
                        width: double.maxFinite,
                      ),
                viewType == 2
                    ? PublishedDateWidget(
                        publishedAt: article.publishedAt,
                        viewType: 2,
                      )
                    : const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(marginMin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: marginMin),
                  article.author != null
                      ? Text(
                          '${tr('by')} ${article.author}',
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      : const SizedBox(),
                  const SizedBox(height: marginMin),
                  viewType == 2
                      ? SingleChildScrollView(
                        child: Text(
                            article.description,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                      )
                      : const SizedBox(),
                  const SizedBox(height: marginMin),
                  viewType == 1
                      ? PublishedDateWidget(publishedAt: article.publishedAt)
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
