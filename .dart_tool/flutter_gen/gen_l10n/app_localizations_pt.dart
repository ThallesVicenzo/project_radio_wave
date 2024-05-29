import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcomeButtonTitle => 'Começar';

  @override
  String get onboardingPageTitle => 'Crie sua conta!';

  @override
  String get onboardingButtonTitle => 'Criar';

  @override
  String get passwordField => 'Senha...';

  @override
  String get networkError => 'Sem conexão com a internet.';
}
