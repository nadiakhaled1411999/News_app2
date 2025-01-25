import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class   CategoriesListView extends StatelessWidget {
  const   CategoriesListView({super.key});
final List<CategoryModel> categories = const [
   CategoryModel(
        categoryImage: "assets/images/science.jpg", categoryName: "science"),
    CategoryModel(
        categoryImage: "assets/images/sports.jpg", categoryName: "sports"),
    CategoryModel(
        categoryImage: "assets/images/technology.jpg", categoryName: "technology"),
    CategoryModel(
        categoryImage: "assets/images/business.jpg", categoryName: "business"),
    CategoryModel(
        categoryImage: "assets/images/entertainment.jpg", categoryName: "entertainment"),
    CategoryModel(
        categoryImage: "assets/images/general.jpg", categoryName: "general"),
    CategoryModel(
        categoryImage: "assets/images/health.jpg", categoryName: "health"),
   
    
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 120,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: categories[index]);
            },
          ),
        );
  }
}