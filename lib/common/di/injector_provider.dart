import 'package:get_it/get_it.dart';
import 'package:snowman/app/features/faq/data/faq.repository.dart';
import 'package:snowman/app/features/faq/ui/faqs/faqs.viewmodel.dart';
import 'package:snowman/app/features/faq/ui/new-faq/newfaq.viewmodel.dart';
import 'package:snowman/common/sources/database.helper.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  // Database
  inject.registerSingleton(() => DatabaseHelper());

  // Repositories
  inject.registerFactory(() => FAQRepository());

  // ViewModels
  inject.registerLazySingleton(() => FAQSViewModel());
  inject.registerLazySingleton(() => NewFAQViewModel());
}