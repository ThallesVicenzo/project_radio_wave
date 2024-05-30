import 'package:firebase_auth/firebase_auth.dart';

abstract class OnboardingDataSource {
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  });
}
