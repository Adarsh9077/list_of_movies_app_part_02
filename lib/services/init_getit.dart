import 'package:get_it/get_it.dart';
import 'package:mvvm_state_management/services/api_services.dart';
import 'package:mvvm_state_management/services/navigation_service.dart';

import '../repository/movies_repository.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepository(getIt<ApiServices>()),
  );
}
