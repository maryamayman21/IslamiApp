import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_list_widget.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_model.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  static const String routeName = 'hadeth';
  @override
  Widget build(BuildContext context) {
    SettingsThemeProvider themeProvider =
        Provider.of<SettingsThemeProvider>(context);
    HadethItem hadethItem =
        ModalRoute.of(context)?.settings.arguments as HadethItem;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(getImagePathByName(
                    imageName: themeProvider.getBackgroundImageTheme())),
                fit: BoxFit.cover)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(hadethItem.hadethTitle),
            ),
            body: HadethListWidget(hadethContent: hadethItem.hadethContent)));
  }
}
