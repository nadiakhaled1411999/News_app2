// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final String? url;

  //final Source? source;
  ArticleModel({
    //required this.source,
    required this.image,
    required this.title,
    required this.description,
    required this.url,
  });
//!Factory عشان اعمل تحويل من ماب لموديول واستخدم كونستراكتور عادي داخل named constructor
  factory ArticleModel.fromJson(Map<String, dynamic> json) {  //!Named constructor
  
    return ArticleModel( //!كونستراكتور عادي

        image: json["urlToImage"],
        title: json["title"],
        description: json["description"],
        url: json["url"]);
  }
}

//!لو مش عايزه ارجع متغير من ماب لاء انا عايزه ارجع ماب كامله هعمل كده

/*class Source {
  final String? id;
  final String? name;
  Source({
    required this.id,
    required this.name,
  });
}*/
