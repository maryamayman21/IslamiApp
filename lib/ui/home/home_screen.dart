import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/setting_tab/setting_tab.dart';
import 'package:islami_app/ui/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabsList = [
    QuranTab(),
    const HadethTab(),
    TasbehTab(),
    const RadioTab(),
    const SettingTab(),
  ];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    SettingsThemeProvider themeProvider =
        Provider.of<SettingsThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(getImagePathByName(
                  imageName: themeProvider.getBackgroundImageTheme())),
              fit: BoxFit.cover)),
      child: Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).colorScheme.primary,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                currentTab = index;
                setState(() {});
              },
              currentIndex: currentTab,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage(getImagePathByName(imageName: 'quran.png'))),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(getImagePathByName(
                        imageName: 'quran-quran-svgrepo-com.png'))),
                    label: AppLocalizations.of(context)!.hadith),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage(getImagePathByName(imageName: 'sebha.png'))),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage(getImagePathByName(imageName: 'radio.png'))),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.setting),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: tabsList[currentTab]),
    );
  }
}
