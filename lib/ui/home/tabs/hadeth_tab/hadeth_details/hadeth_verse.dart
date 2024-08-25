import 'package:flutter/material.dart';

class HadethVerse extends StatelessWidget {
  const HadethVerse({super.key, required this.hadethVerse});
  final String hadethVerse;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Text(hadethVerse,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall));
  }
}
