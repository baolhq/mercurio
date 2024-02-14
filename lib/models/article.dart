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
}
