import 'package:get_it/get_it.dart';
import './music_service.dart';
import 'package:meditasyon_app/repository/homepage_repository.dart';

GetIt locator = new GetIt();

void setupLocator() {
  locator.registerLazySingleton<MusicService>(() => MusicService());
}