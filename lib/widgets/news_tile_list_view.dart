// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

// ignore: must_be_immutable
class NewsTileListView extends StatelessWidget {
  List<ArticleModel> articles;
NewsTileListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: NewsTile(
          articleModel: articles[index],
        ),
      );
    }));
  }
}
