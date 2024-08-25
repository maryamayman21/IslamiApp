import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/language_provider.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/theme/theme_data.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islami_app/ui/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SettingsThemeProvider()),
    ChangeNotifierProvider(create: (context) => SettingsLanguageProvider())
  ], child: const IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<SettingsLanguageProvider>(context).currentLag),
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetailsScreen.routeName: (_) => const QuranDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen()
      },
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: settingProvider.currentTheme,
    );
  }
}
