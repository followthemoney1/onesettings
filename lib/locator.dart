import 'package:get_it/get_it.dart';

import 'host/services/api.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());

//  locator.registerFactory(() => CommentsModel());
}