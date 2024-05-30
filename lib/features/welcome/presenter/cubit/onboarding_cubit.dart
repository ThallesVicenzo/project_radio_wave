import 'package:flutter/material.dart';
import 'package:radio_wave/core/utils/base_cubit.dart';
import 'package:radio_wave/features/welcome/domain/usecase/onboarding_usecase.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends BaseCubit<OnboardingState> {
  OnboardingCubit(this._usecase) : super(const OnboardingInitialState());

  final OnboardingUsecase _usecase;

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final controllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController()
  ];

  Future<void> createAccount() async {
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
