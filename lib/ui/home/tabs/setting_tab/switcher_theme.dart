import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Provider.of<SettingsThemeProvider>(context).switchState,
        onChanged: (value) {
          setState(() {
            value
                ? Provider.of<SettingsThemeProvider>(context, listen: false)
                    .changeAppTheme(ThemeMode.dark, value)
                : Provider.of<SettingsThemeProvider>(context, listen: false)
                    .changeAppTheme(ThemeMode.light, value);
          });
        });
  }
}
