import 'package:get_it/get_it.dart';
import './music_service.dart';


GetIt locator = new GetIt();

void setupLocator() {
  locator.registerLazySingleton<MusicService>(() => MusicService());
}
