import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth_repository_impl.dart';
import 'package:spotify/data/repository/song_repository_impl.dart';
import 'package:spotify/data/sources/auth_firebase_service.dart';
import 'package:spotify/data/sources/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth.dart';
import 'package:spotify/domain/repository/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

}
