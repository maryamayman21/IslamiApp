import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/utils/image_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );

    return Scaffold(
      body: Image.asset(
        getImagePathByName(imageName: 'splash.png'),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
