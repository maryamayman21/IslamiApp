import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/settings_provider/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsLanguageProvider languageProvider =
        Provider.of<SettingsLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              languageProvider.changeAppLanguage('en');
            },
            child: languageProvider.currentLag == 'en'
                ? buildSelectedThemeItem(
                    context, AppLocalizations.of(context)!.english)
                : buildUnSelectedThemeItem(
                    context, AppLocalizations.of(context)!.english),
          ),
          GestureDetector(
            onTap: () {
              languageProvider.changeAppLanguage('ar');
            },
            child: languageProvider.currentLag == 'ar'
                ? buildSelectedThemeItem(
                    context, AppLocalizations.of(context)!.arabic)
                : buildUnSelectedThemeItem(
                    context, AppLocalizations.of(context)!.arabic),
          )
        ],
      ),
    );
  }
}

Widget buildSelectedThemeItem(context, String selectedItem) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        selectedItem,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
      const Icon(
        Icons.check,
      ),
    ],
  );
}

Widget buildUnSelectedThemeItem(context, String unSeletedItem) {
  return Row(
    children: [
      Text(
        unSeletedItem,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ],
  );
}
