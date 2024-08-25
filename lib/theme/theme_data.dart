import 'package:flutter/material.dart';

class AppThemeData {
  static const Color goldColor = Color(0xFFB7935F);
  static const Color darkBlueColor = Color(0xFF141A2E);
  static const Color darkOnSecondry = Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
      primaryColor: goldColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFB7935F),
        primary: const Color(0xFFB7935F),
        secondary: const Color(0xFFB7935F),
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: goldColor),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30)),
      scaffoldBackgroundColor: Colors.transparent,
      // canvasColor: const Color(0xFFB7935F),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 24),
          showSelectedLabels: true,
          showUnselectedLabels: true),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: Colors.black, fontSize: 20),
      ),
      dividerColor: goldColor,
      cardColor: Colors.white,
      cardTheme: CardTheme(
          color: Colors.white,
          elevation: 16,
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      indicatorColor: goldColor,
      iconTheme: const IconThemeData(color: goldColor, size: 30, weight: 30),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: goldColor, // Background color in light mode
          // Text color in light mode
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: darkBlueColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkBlueColor,
        primary: darkBlueColor,
        secondary: darkOnSecondry,
      ),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: darkOnSecondry),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30)),
      scaffoldBackgroundColor: Colors.transparent,
      // canvasColor: const Color(0xFFB7935F),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: darkOnSecondry,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(size: 36),
          unselectedIconTheme: IconThemeData(size: 24),
          showSelectedLabels: true,
          showUnselectedLabels: true),
      textTheme: const TextTheme(
        labelMedium: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: darkOnSecondry, fontSize: 20),
      ),
      dividerColor: darkOnSecondry,
      cardColor: darkBlueColor,
      cardTheme: CardTheme(
          color: darkBlueColor,
          elevation: 16,
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      indicatorColor: darkOnSecondry,
      iconTheme:
          const IconThemeData(color: darkOnSecondry, size: 30, weight: 30),
      switchTheme: SwitchThemeData(
        // thumbColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.selected)) {
        //     return darkOnSecondry; // Thumb color when switch is ON
        //   }
        //   return goldColor; // Thumb color when switch is OFF
        // }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return darkOnSecondry; // Track color when switch is ON
          }
          return goldColor; // Track color when switch is OFF
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkBlueColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkOnSecondry, // Background color in light mode
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ));
}
