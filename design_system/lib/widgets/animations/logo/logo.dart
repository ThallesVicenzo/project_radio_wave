import 'dart:async';

import 'package:design_system/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  double radioOpacity = 0;
  double waveOpacity = 0;
  bool lightUp = false;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
          radioOpacity = 1;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height * 0.2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedOpacity(
            opacity: radioOpacity,
            duration: kThemeAnimationDuration,
            onEnd: () {
              setState(() {
                waveOpacity = 1;
              });
            },
            child: AppText(
              'Radio',
              fontStyle: GoogleFonts.bungeeShade(
                color: Colors.pink,
                fontSize: FontSize.xxLarge.size,
                shadows: lightUp
                    ? [
                        for (double i = 1; i < 5; i++)
                          Shadow(
                            color: Colors.blue,
                            blurRadius: 3 * i,
                          ),
                      ]
                    : null,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1500),
            top: deviceSize.height * 0.08,
            right: waveOpacity == 0 ? 1 : deviceSize.width * 0.2,
            onEnd: () {
              setState(() {
                lightUp = !lightUp;
              });
            },
            child: AnimatedOpacity(
              opacity: waveOpacity,
              duration: kThemeAnimationDuration,
              child: AppText(
                'Wave',
                fontStyle: GoogleFonts.bungeeShade(
                  shadows: lightUp
                      ? [
                          for (double i = 1; i < 5; i++)
                            Shadow(
                              color: i == 3 ? Colors.blue : Colors.pink,
                              blurRadius: 3 * i,
                            ),
                        ]
                      : null,
                  color: Colors.blue,
                  fontSize: FontSize.xLarge.size,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
