class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String author;
  final String publishedAt;
  final String urlToImage;
  final String category;
  final String? content;
  final String authorImageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.author,
    required this.publishedAt,
    required this.urlToImage,
    required this.category,
    required this.content,
    required this.authorImageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      author: json['author'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      category: json['category'] ?? '',
      content: json['content'] ?? '',
      authorImageUrl: json['authorImageUrl'] ?? '',

    );
  }
}