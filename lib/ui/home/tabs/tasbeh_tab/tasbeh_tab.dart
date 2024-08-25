import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider/theme_provider.dart';
import 'package:islami_app/utils/image_paths.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehTab extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TasbehTab createState() => _TasbehTab();
}

class _TasbehTab extends State<TasbehTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  //late Animation<double> _animation;
  double _rotationValue = 0;
  int noOfTasbeh = 0;
  int currentTasbeh = 0;
  List<String> tsabeh = [
    "الحمدلله",
    "سبحان الله",
    "الله اكبر",
    "لا حول ولا قوة الا بالله",
    "لا اله الا الله",
    "استغفر الله"
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duration of the rotation
      vsync: this,
    );

    // _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _rotate() {
    setState(() {
      _rotationValue += 0.03; // Slight increase in rotation
      noOfTasbeh++;
      if (noOfTasbeh == 33) {
        noOfTasbeh = 0;
        currentTasbeh++;
        currentTasbeh = currentTasbeh % tsabeh.length;
      }
    });

    // _controller.reset();
    // _controller.forward();
  }

  // void _resetRotation() {
  //   _controller.reverse(); // Animate backward to original state
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(
                  _rotationValue), // Apply rotation value
              child: Stack(
                  alignment: Alignment.center, // Center the images in the stack
                  children: [
                    // Bottom image
                    Image.asset(
                      getImagePathByName(
                          imageName: Provider.of<SettingsThemeProvider>(context)
                              .getSebhaBodyTheme()),
                      height: 300,
                      width: 300,
                    ),
                    // Top image
                    Positioned(
                      top: 0, // Adjust this value to align properly
                      child: Image.asset(
                        getImagePathByName(
                            imageName:
                                Provider.of<SettingsThemeProvider>(context)
                                    .getSebhaHeadTheme()),
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ])),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.noOfTasbeh,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('$noOfTasbeh',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: _rotate,
          child: Text(
            tsabeh[currentTasbeh],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _rotationValue = 0;
                noOfTasbeh = 0;
                // _controller
                //     .reset(); // Reset rotation value to its original state
              });
            },
            child: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.black,
            ))
      ],
    );
  }
}
