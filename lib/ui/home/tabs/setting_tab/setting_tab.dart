import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/language_provider.dart';
import 'package:islami_app/ui/home/tabs/setting_tab/language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ui/home/tabs/setting_tab/switcher_theme.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  bool showBox = false;
  @override
  Widget build(BuildContext context) {
    SettingsLanguageProvider languageProvider =
        Provider.of<SettingsLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.dark_mode,
                ),
                const SizedBox(
                  width: 23,
                ),
                Text(
                  AppLocalizations.of(context)!.darkMode,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const ThemeSwitcher()
          ],
        ),
        Container(
          height: 1,
          margin: const EdgeInsets.all(16),
          color: Theme.of(context).dividerColor,
        ),
        Row(
          children: [
            const Icon(
              Icons.language,
            ),
            const SizedBox(
              width: 23,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            showLanguageBottomSheet(context);
          },
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 2)),
            child: Text(
              languageProvider.currentLag == 'en'
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        )
      ]),
    );
  }
}

void showLanguageBottomSheet(context) {
  showModalBottomSheet(
      context: context, builder: (context) => const LanguageBottomSheet());
}
