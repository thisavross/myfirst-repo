class NewsOrgModel {
  String? author;
  String? title;
  String? description;
  String? urlToImage;

  NewsOrgModel({this.author, this.description, this.title, this.urlToImage});

  NewsOrgModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
  }
}