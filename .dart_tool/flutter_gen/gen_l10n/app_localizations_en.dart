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
}
