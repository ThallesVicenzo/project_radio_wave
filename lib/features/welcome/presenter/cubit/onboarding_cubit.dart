import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:radio_wave/core/utils/base_cubit.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends BaseCubit<OnboardingState> with HydratedMixin {
  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  OnboardingCubit(super.initialState);

  @override
  OnboardingState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(OnboardingState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
