import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song_firebase_service.dart';
import 'package:spotify/domain/repository/song.dart';
import "package:spotify/service_locator.dart";

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

}