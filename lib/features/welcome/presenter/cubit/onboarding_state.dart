import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radio_wave/core/errors/failure.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitialState extends OnboardingState {
  const OnboardingInitialState();
}

class OnboardingLoadingState extends OnboardingState {
  const OnboardingLoadingState();
}

class OnboardingSuccessState extends OnboardingState {
  final UserCredential userCredential;
  const OnboardingSuccessState(this.userCredential);
}

class OnboardingErrorState extends OnboardingState {
  final Failure failure;
  const OnboardingErrorState(this.failure);
}
