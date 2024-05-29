import 'package:radio_wave/core/errors/failure.dart';

import '../../app_injector.dart';
import '../../l10n/global_app_localizations.dart';

final intl = sl<GlobalAppLocalizations>().current;

class GenericFailure extends Failure {
  const GenericFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String? message]) : super(message ?? intl.networkError);
}
