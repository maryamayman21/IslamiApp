import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_details/verses_provider.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/sura_title_widget.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatelessWidget {
  const QuranDetailsScreen({super.key});
  static const String routeName = '/quran_details';

  @override
  Widget build(BuildContext context) {
    SuraArgs suraArgs = ModalRoute.of(context)?.settings.arguments as SuraArgs;
    SettingsThemeProvider themeProvider =
        Provider.of<SettingsThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(getImagePathByName(
                  imageName: themeProvider.getBackgroundImageTheme())),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(suraArgs.surahName),
        ),
        body: VersesProvider(
          suraArgs: suraArgs,
        ),
      ),
    );
  }

  // void getFileData(int fileIndex) async {
  //   String fileContent =
  //       await rootBundle.loadString('assets/files/${fileIndex + 1}.txt');
  //   List<String> suraLines = fileContent.split('/n');
  //   suraVerses = suraLines;

  //   setState(() {});
}
