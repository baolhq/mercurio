import 'package:flutter/material.dart';
import 'package:mercurio/tags_list.dart';

class TagsPanel extends StatefulWidget {
  const TagsPanel({super.key, required this.callback});

  final Function callback;

  @override
  State<TagsPanel> createState() => _TagsPanelState();
}

class _TagsPanelState extends State<TagsPanel> {
  int selectedTagIndex = 0;
  List<String> tags = Tags.tags;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < tags.length; i++)
            GestureDetector(
              onTap: () {
                widget.callback(tags[i]);

                setState(() {
                  selectedTagIndex = i;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: selectedTagIndex == i
                          ? Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 2)
                          : Border.all(
                              color: Theme.of(context).dividerColor, width: 2),
                      color: selectedTagIndex == i
                          ? Theme.of(context).primaryColorDark
                          : Theme.of(context).scaffoldBackgroundColor),
                  margin: const EdgeInsets.only(right: 8, bottom: 16),
                  width: 120,
                  height: 36,
                  alignment: Alignment.center,
                  child: Text(
                    tags[i],
                    style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: selectedTagIndex == i
                            ? Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.color
                            : Theme.of(context).dividerColor),
                  )),
            )
        ],
      ),
    );
  }
}
