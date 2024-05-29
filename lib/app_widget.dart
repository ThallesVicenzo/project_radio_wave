import 'package:design_system/widgets/colors/radiowave_colors.dart';
import 'package:design_system/widgets/colors/ui_overlay_color.dart';
import 'package:flutter/material.dart';
import 'package:radio_wave/app_injector.dart';

import 'core/presenter/routes/app_main_routes_manager.dart';
import 'l10n/global_app_localizations.dart';

class RadioWave extends StatelessWidget {
  const RadioWave({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Radiowave',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: RadioWaveColors.backgroundColor,
      ),
      builder: (context, child) {
        sl<GlobalAppLocalizations>().setAppLocalizations(
          AppLocalizations.of(context),
        );

        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .removeCurrentSnackBar(reason: SnackBarClosedReason.swipe);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: UiOverlayColor(
            child: child!,
          ),
        );
      },
    );
  }
}
