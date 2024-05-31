import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:radio_wave/app_injector.dart';
import 'package:radio_wave/core/utils/base_cubit.dart';
import 'package:radio_wave/features/welcome/domain/usecase/onboarding_usecase.dart';
import 'package:radio_wave/l10n/global_app_localizations.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends BaseCubit<OnboardingState> {
  OnboardingCubit(this._usecase) : super(const OnboardingInitialState());

  final OnboardingUsecase _usecase;

  final intl = sl<GlobalAppLocalizations>().current;

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController()
  ];

  String? validateEmail(String? value) {
    if (value == null) {
      return intl.emptyField;
    } else if (EmailValidator.validate(value) == false) {
      return intl.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null) {
      return intl.emptyField;
    } else if (value.length < 6) {
      return intl.passwordValidation;
    }

    return null;
  }

  Future<void> createAccount() async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate()) {
      emit(const OnboardingLoadingState());

      final result = await _usecase.createAccount(
        email: controllers.first.text,
        password: controllers[1].text,
      );

      result.fold(
        (l) {
          emit(OnboardingErrorState(l));
        },
        (r) {
          emit(OnboardingSuccessState(r));
        },
      );
    }
  }
}
