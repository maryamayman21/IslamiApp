import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_details/verse_widget.dart';

class VerseListWidget extends StatelessWidget {
  const VerseListWidget({super.key, required this.suraVerses});

  final List<String> suraVerses;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Card(
          child: ListView.separated(
              itemCount: suraVerses.length,
              itemBuilder: (context, index) {
                return VerseWidget(
                  verse: suraVerses[index],
                  verseNum: index + 1,
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).dividerColor,
                    thickness: 1,
                    height: 1,
                    endIndent: 30,
                    indent: 30,
                  ))),
    );
  }
}
