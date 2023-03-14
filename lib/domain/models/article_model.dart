import 'dart:convert';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

class ArticleModel {
  ArticleModel({
    required this.data,
  });

  List<Datum> data;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.section,
    this.sectionTitle,
    required this.items,
  });

  String section;
  String? sectionTitle;
  List<Item> items;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        section: json["section"],
        sectionTitle: json["section_title"] ?? 'Our Blog',
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    this.articleTitle,
    this.articleImage,
    required this.link,
    this.productName,
    this.productImage,
  });

  String? articleTitle;
  String? articleImage;
  String link;
  String? productName;
  String? productImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        articleTitle: json["article_title"] ?? '',
        articleImage: json["article_image"] ?? '',
        link: json["link"],
        productName: json["product_name"] ?? '',
        productImage: json["product_image"] ?? '',
      );
}
