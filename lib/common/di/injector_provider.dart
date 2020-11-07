import 'package:get_it/get_it.dart';
import 'package:snowman/app/features/home/ui/home.viewmodel.dart';
import 'package:snowman/common/sources/database.helper.dart';
import 'package:snowman/features/home/data/faq.repository.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  // Database
  inject.registerSingleton(() => DatabaseHelper());

  // Repositories
  inject.registerFactory(() => FAQRepository());

  // ViewModels
  inject.registerLazySingleton(() => HomeViewModel());
}
