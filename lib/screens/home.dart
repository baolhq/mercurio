import 'package:flutter/material.dart';
import 'package:mercurio/models/article.dart';
import 'package:mercurio/screens/details.dart';
import 'package:mercurio/tags_list.dart';
import 'package:mercurio/widgets/colored_safe_area.dart';
import 'package:mercurio/widgets/search_box.dart';
import 'package:mercurio/widgets/tags_panel.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> articles = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Initial load
    _updateList(Tags.tags[0]);
  }

  void _updateList(String tag) async {
    // Remove whitespace
    final trimmedTag = tag.replaceAll(" ", "");
    final baseUrl =
        "https://rss.nytimes.com/services/xml/rss/nyt/$trimmedTag.xml";

    final dio = Dio();
    final res = await dio.get(baseUrl);

    if (res.statusCode == 200) {
      final doc = XmlDocument.parse(res.data);
      final articlesXml = doc.findAllElements("item");

      for (var art in articlesXml) {
        String title,
            desc,
            link,
            creator,
            pubDate,
            mediaContent =
                "https://img.freepik.com/free-vector/illustration-gallery-icon_53876-27002.jpg",
            mediaCredit = "";

        title = art.findElements("title").first.innerText;
        desc = art.findElements("description").first.innerText;
        link = art.findElements("link").first.innerText;
        creator = art.findElements("dc:creator").first.innerText;
        pubDate = art.findElements("pubDate").first.innerText;

        if (art.findElements("media:content").isNotEmpty) {
          String url = art
              .findElements("media:content")
              .first
              .getAttribute("url")
              .toString();
          mediaContent = url.startsWith("https://") ? url : "https://$url";
        }

        if (art.findElements("media:credit").isNotEmpty) {
          mediaCredit = art.findElements("media:credit").first.innerText;
        }

        setState(() {
          articles.add(Article(
              title: title,
              desc: desc,
              link: link,
              creator: creator,
              pubDate: DateTime.now(),
              thumbnailUrl: mediaContent,
              thumbnailCredit: mediaCredit));
        });
      }
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Theme.of(context).primaryColor,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child:
              CustomScrollView(cacheExtent: 3500, shrinkWrap: false, slivers: [
            SliverAppBar(
                floating: true,
                snap: true,
                stretch: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(128),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      Container(
                        color: Theme.of(context).dividerColor,
                        height: 2,
                      ),
                      const SearchBox(),
                      TagsPanel(callback: _updateList),
                    ]),
                  ),
                ),
                leading: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.menu_rounded, size: 28),
                  ),
                ),
                title: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "MERCURIO",
                    style: TextStyle(fontFamily: 'Carnevalee'),
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.account_circle_rounded,
                        size: 32,
                      ),
                    ),
                  )
                ]),
            SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                sliver: _buildList())
          ]),
        ));
  }

  Widget _buildList() {
    return SliverList.separated(
      itemCount: articles.length + 1, // Add one item for progess indicator
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 2,
          color: Theme.of(context).dividerColor,
        );
      },
      itemBuilder: (BuildContext context, index) {
        if (index == articles.length) {
          return _buildProgressIndicator();
        } else {
          return _buildCard(articles[index].title, articles[index].desc,
              articles[index].thumbnailUrl);
        }
      },
    );
  }

  Widget _buildCard(String title, String desc, String thumbnailUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Details()));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Theme.of(context).cardColor,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        child: Row(children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 52,
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 64,
                  alignment: Alignment.topLeft,
                  child: Text(
                    desc,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )
              ],
            ),
          ),
          Container(
              width: 128,
              height: 128,
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
              ))
        ]),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
