import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_details/quran_details.dart';

class SuraTitleWidget extends StatelessWidget {
  const SuraTitleWidget(
      {super.key,
      required this.suraTitle,
      required this.suraVerses,
      required this.index});
  final String suraTitle;
  final String suraVerses;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QuranDetailsScreen.routeName,
            arguments: SuraArgs(surahName: suraTitle, index: index));
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              suraTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              color: Theme.of(context).dividerColor,
              thickness: 2,
              width: 2,
            ),
          ),
          Expanded(
            child: Text(
              suraVerses,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class SuraArgs {
  final String surahName;
  final int index;

  SuraArgs({required this.surahName, required this.index});
}
