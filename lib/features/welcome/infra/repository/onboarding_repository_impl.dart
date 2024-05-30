import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:radio_wave/core/errors/failure.dart';
import 'package:radio_wave/core/errors/failures.dart';
import 'package:radio_wave/features/welcome/domain/repository/onboarding_repository.dart';
import 'package:radio_wave/features/welcome/infra/datasource/onboarding_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingDataSource dataSource;

  OnboardingRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserCredential>> registerAccount({
    required String email,
    required String password,
  }) async {
    try {
      final request =
          await dataSource.createAccount(email: email, password: password);
      return Right(request);
    } catch (e) {
      return Left(
        GenericFailure(e.toString()),
      );
    }
  }
}
