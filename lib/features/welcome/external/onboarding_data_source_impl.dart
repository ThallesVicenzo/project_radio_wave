import 'package:firebase_auth/firebase_auth.dart';
import 'package:radio_wave/features/welcome/infra/datasource/onboarding_data_source.dart';

class OnboardingDataSourceImpl implements OnboardingDataSource {
  final FirebaseAuth firebaseAuth;

  OnboardingDataSourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return result;
  }
}
