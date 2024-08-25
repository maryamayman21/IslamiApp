import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_verse.dart';

class HadethListWidget extends StatelessWidget {
  const HadethListWidget({super.key, required this.hadethContent});
  final List<String> hadethContent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 8,
        margin: const EdgeInsets.all(30),
        child: ListView.builder(
            itemCount: hadethContent.length,
            itemBuilder: (context, index) {
              return HadethVerse(hadethVerse: hadethContent[index]);
            }),
      ),
    );
  }
}
