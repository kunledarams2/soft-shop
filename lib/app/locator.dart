import 'package:get_it/get_it.dart';
import 'package:softshop_mobile/core/services/http/http_service.dart';
import 'package:softshop_mobile/core/services/http/http_service_impl.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {

  locator.registerLazySingleton<NavigationService>(
    () => NavigationService()
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<HttpService>(
    () => HttpServiceImpl()
  );
}