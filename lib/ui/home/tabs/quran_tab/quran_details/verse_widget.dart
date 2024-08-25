import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  const VerseWidget({super.key, required this.verse, required this.verseNum});
  final String verse;
  final int verseNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 16),
      alignment: Alignment.center,
      child: Text(
        '$verse ($verseNum)',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
