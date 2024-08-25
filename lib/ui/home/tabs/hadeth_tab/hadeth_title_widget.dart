import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTitleWidget extends StatelessWidget {
  const HadethTitleWidget(
      {super.key, required this.hadethItem, required this.hadethIndex});
  final HadethItem hadethItem;
  final int hadethIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadethItem);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.hadethNumber,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '${hadethIndex + 1}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class HadethArg {
  final int hadethIndex;

  HadethArg({required this.hadethIndex});
}
