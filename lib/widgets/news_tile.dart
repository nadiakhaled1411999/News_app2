import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_web_view.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  NewsTile({super.key, required this.articleModel});
  ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsWebView(
                    url: articleModel.url ?? "news not available")));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: articleModel.image != null &&
                      articleModel.image!.isNotEmpty
                  ? articleModel.image!
                  : "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Z2VuZXJhbHxlbnwwfHwwfHx8MA%3D%3D",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
             errorWidget: (context, url, error) {
              print('Error loading image: $error');
              return   const Icon(Icons.error, size: 70, color: Colors.red);
  }),
          ),
          Text(
            articleModel.title ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
          ),
          Text(
            articleModel.description ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
