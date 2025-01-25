import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_tile_list_view_builder.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "News ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "Cloud",
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
         NewsTileListViewBuilder(category: "general",),
            ],
          )),
    );
  }
}
/* Column(
            children: [
              CategoriesListView(),
              SizedBox(height: 32,),
              Expanded(
                child: NewsTileListView(),
              ),
            ],*/