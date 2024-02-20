class Article {
  final String title;
  final String desc;
  final String link;
  final String creator;
  final DateTime pubDate;
  final String thumbnailUrl;
  final String thumbnailCredit;

  const Article(
      {required this.title,
      required this.desc,
      required this.link,
      required this.creator,
      required this.pubDate,
      this.thumbnailUrl = "",
      this.thumbnailCredit = ""});

  factory Article.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "title": String title,
        "desc": String desc,
        "link": String link,
        "creator": String creator,
        "pubDate": String pubDate,
        "mediaContent": String mediaContent,
        "mediaCredit": String mediaCredit
      } =>
        Article(
            title: title,
            desc: desc,
            link: link,
            creator: creator,
            pubDate: DateTime.now(),
            thumbnailUrl: mediaContent,
            thumbnailCredit: mediaCredit),
      _ => throw const FormatException("Failed to load article.")
    };
  }
}
