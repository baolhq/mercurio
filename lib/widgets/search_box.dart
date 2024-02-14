import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
      ),
      child: Row(
        children: [
          Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: const Icon(
                Icons.search,
                size: 36,
              )),
          Expanded(
              child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const TextField(
                    style: TextStyle(
                      decoration: TextDecoration.none,
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  )))
        ],
      ),
    );
  }
}
