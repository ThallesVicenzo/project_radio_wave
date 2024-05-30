import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radio_wave/core/errors/failure.dart';
import 'package:radio_wave/features/welcome/domain/repository/onboarding_repository.dart';

abstract class OnboardingUsecase {
  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
  });
}

class OnboardingUsecaseImpl implements OnboardingUsecase {
  final OnboardingRepository repository;

  OnboardingUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> createAccount({
    required String email,
    required String password,
  }) async {
    return await repository.registerAccount(email: email, password: password);
  }
}
