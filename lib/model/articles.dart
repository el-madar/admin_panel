
List<Articles> articlesFromJson(List list) => List<Articles>.from(list.map((x) => Articles.fromJson(x)));

class Articles {
  Articles({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"] ?? '',
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

}
