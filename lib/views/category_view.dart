import 'package:flutter/material.dart';


import 'package:news_app/widgets/news_tile_list_view_builder.dart';

class  CategoryView extends StatelessWidget {
  const  CategoryView({super.key, required this.category});
 final String category;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    body:Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
      slivers: [
          NewsTileListViewBuilder(category:category),
      ],
      ),
    ),
    );
  }
}