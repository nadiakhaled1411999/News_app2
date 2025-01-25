import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?apiKey=8f04bca737834002bb4ca3aab8ebcd46&country=us&category=$category");
      Map<String, dynamic> jsonData = response.data;
      // print(jsonData);
      // print("Total Results:${jsonData["articles"]}");
      //List<Map<String,dynamic>> articles = jsonData["articles"] as List<Map<String,dynamic>>;
      //print(articles);
      List<dynamic> articles =
          jsonData["articles"]; //!جبت السته اللي فيها  مجموعه من الماب من النت
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        //!ده عشان امر على كل ماب داخل الست اخد منها الدتا اللي انا عايزها
      ArticleModel articleModel=ArticleModel.fromJson(article);//!Named constructor
        articleList.add(
            articleModel); //!كده انا كل ماب بمر عليها باخد الدتا اللي انا عايزها واضيفها للموديل وبعدين اضيف كل موديل الي السته بتاعت الموديل االلي كانت فااضيه
      }
      return articleList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
/* ArticleModel articleModel = ArticleModel(
            // source: Source(id:article["source"]["id"],name:article["source"]["name"])
            image: article["urlToImage"],
            title: article["title"],
            description: article["description"]);*/
