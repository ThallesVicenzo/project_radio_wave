import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_wave/l10n/global_app_localizations.dart';

import 'core/client/client_http.dart';
import 'core/client/dio/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<GlobalAppLocalizations>(
    GlobalAppLocalizationsImpl(),
  );

  sl.registerSingleton<ClientHttp>(DioClient());

  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
}
