import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile_list_view.dart';

class NewsTileListViewBuilder extends StatefulWidget {
  const NewsTileListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsTileListViewBuilder> createState() =>
      _NewsTileListViewBuilderState();
}

class _NewsTileListViewBuilderState extends State<NewsTileListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsTileListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(
                        child: Text("opps there was an error ,try later"))));
          } else {
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });

    /*isLoading
        ? const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 200),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : articles.isNotEmpty
            ? NewsTileListView(articles: articles)
            : const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top:200),
                  child: Center(
                    child: Text("opps there was an error ,try later"),
                  ),
                ),
              );*/
  }
}
