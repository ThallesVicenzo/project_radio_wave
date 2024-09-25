import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_wave/core/geolocator/location_service.dart';
import 'package:radio_wave/core/geolocator/save_country_name.dart';
import 'package:radio_wave/core/secure_storage/secure_storage.dart';
import 'package:radio_wave/core/secure_storage/secure_storage_impl.dart';
import 'package:radio_wave/features/home/infra/datasource/home_datasource.dart';
import 'package:radio_wave/features/welcome/domain/repository/onboarding_repository.dart';
import 'package:radio_wave/features/welcome/domain/usecase/onboarding_usecase.dart';
import 'package:radio_wave/features/welcome/external/onboarding_data_source_impl.dart';
import 'package:radio_wave/features/welcome/infra/datasource/onboarding_data_source.dart';
import 'package:radio_wave/features/welcome/infra/repository/onboarding_repository_impl.dart';
import 'package:radio_wave/l10n/global_app_localizations.dart';

import 'core/client/client_http.dart';
import 'core/client/dio/dio_client.dart';
import 'features/home/domain/repository/home_repository.dart';
import 'features/home/domain/usecase/home_usecase.dart';
import 'features/home/external/home_datasource_impl.dart';
import 'features/home/infra/repository/home_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<GlobalAppLocalizations>(
    GlobalAppLocalizationsImpl(),
  );

  sl.registerSingleton<LocationService>(LocationService());

  sl.registerSingleton<SaveCountryName>(SaveCountryNameImpl());

  sl.registerSingleton<SecureStorage>(SecureStorageImpl());

  sl.registerSingleton<ClientHttp>(DioClient());

  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  sl.registerFactory<OnboardingDataSource>(
    () => OnboardingDataSourceImpl(sl()),
  );

  sl.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(sl()),
  );

  sl.registerFactory<OnboardingUsecase>(
    () => OnboardingUsecaseImpl(sl()),
  );

  sl.registerFactory<HomeDatasource>(
    () => HomeDatasourceImpl(sl(), sl(), sl()),
  );

  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(sl()),
  );

  sl.registerFactory<HomeUsecase>(
    () => HomeUsecaseImpl(sl()),
  );
}
