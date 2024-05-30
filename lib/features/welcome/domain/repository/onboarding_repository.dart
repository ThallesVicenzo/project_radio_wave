import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radio_wave/core/errors/failure.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, UserCredential>> registerAccount({
    required String email,
    required String password,
  });
}
