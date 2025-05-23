import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data =
          await FirebaseFirestore.instance
              .collection("songs")
              .orderBy("releaseDate", descending: true)
              .limit(3)
              .get();
      for (var element in data.docs) {
        var song = SongModel.fromJson(element.data());
        songs.add(song.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return Left("An error occurred, please try again.");
    }
  }
}
