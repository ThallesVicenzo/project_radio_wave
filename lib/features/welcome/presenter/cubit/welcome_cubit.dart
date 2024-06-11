// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:radio_wave/core/presenter/routes/app_navigator/app_navigator.dart';
import 'package:radio_wave/core/presenter/routes/main_routes.dart';
import 'package:radio_wave/core/secure_storage/keys/secure_storage_keys.dart';
import 'package:radio_wave/core/secure_storage/secure_storage.dart';
import 'package:radio_wave/core/utils/base_cubit.dart';
import 'package:radio_wave/features/welcome/presenter/cubit/welcome_state.dart';
import 'package:radio_wave/features/welcome/welcome_routes.dart';

class WelcomeCubit extends BaseCubit<WelcomeState> {
  WelcomeCubit(this._secureStorage)
      : super(
          const WelcomeInitialState(),
        );

  final SecureStorage _secureStorage;

  Future<void> redirectToCorrectPage(BuildContext context) async {
    final bool result = json.decode(
      await _secureStorage.read(
              key: SecureStorageKeys.redirectOnboarding.key) ??
          'false',
    );

    if (result == true) {
      AppNavigator(context).goNamed(
        MainRoutes.home.route,
      );
    } else {
      AppNavigator(context).pushNamed(
        WelcomeRoutes.onboardingPage.route,
      );
    }
  }
}
