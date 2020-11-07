import 'package:get_it/get_it.dart';
import 'package:snowman/app/data/faq.repository.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  inject.registerFactory(() => FAQRepository());
  // inject.registerLazySingleton(() => HomeViewModel());
}
