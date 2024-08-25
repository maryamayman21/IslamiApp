import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(getImagePathByName(imageName: 'radio_quran.png')),
        Text(
          AppLocalizations.of(context)!.holyQuranRadio,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Image.asset(getImagePathByName(
            imageName: Provider.of<SettingsThemeProvider>(context)
                .getPlayRadioButtonTheme()))
      ],
    );
  }
}
