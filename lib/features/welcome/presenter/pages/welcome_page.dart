import 'dart:async';

import 'package:design_system/enums/app_images.dart';
import 'package:design_system/widgets/animations/logo/logo.dart';
import 'package:design_system/widgets/buttons/default_button.dart';
import 'package:design_system/widgets/colors/ui_overlay_color.dart';
import 'package:design_system/widgets/custom_padding/custom_padding_page.dart';
import 'package:design_system/widgets/image/asset_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_wave/app_injector.dart';
import 'package:radio_wave/features/welcome/presenter/cubit/welcome_cubit.dart';
import 'package:radio_wave/l10n/global_app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final intl = sl<GlobalAppLocalizations>().current;

  double opacity = 0;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          opacity = 1;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(sl()),
      child: UiOverlayColor(
        overlayColor: Colors.transparent,
        child: Scaffold(
          body: Stack(
            children: [
              const SizedBox.expand(
                child: AssetImageWidget(
                  image: AppImage.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              CustomPaddingPage(
                topPadding: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Logo(),
                    const SizedBox(height: 100),
                    Builder(builder: (context) {
                      return AnimatedOpacity(
                        opacity: opacity,
                        duration: kThemeAnimationDuration,
                        child: DefaultButton(
                          title: intl.welcomeButtonTitle,
                          size: const Size(double.infinity, 56),
                          onPressed: () async {
                            await context
                                .read<WelcomeCubit>()
                                .redirectToCorrectPage(context);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
