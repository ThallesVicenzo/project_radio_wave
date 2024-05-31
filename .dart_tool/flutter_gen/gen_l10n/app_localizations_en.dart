import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeButtonTitle => 'Get Started';

  @override
  String get onboardingPageTitle => 'Register your account!';

  @override
  String get onboardingButtonTitle => 'Create';

  @override
  String get passwordField => 'Password...';

  @override
  String get networkError => 'No internet connection';

  @override
  String get emptyField => 'This field cant be empty!';

  @override
  String get invalidEmail => 'Please type a valid email.';

  @override
  String get passwordValidation => 'Password can not have less than six characters.';
}
