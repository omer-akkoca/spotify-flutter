import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  late String title;
  late String artist;
  late num duration;
  late Timestamp releaseDate;
  late String cover;
  late String song;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.cover,
    required this.song,
  });

  SongModel.fromJson(Map<String, dynamic> map) {
    title = map["title"];
    artist = map["artist"];
    duration = map["duration"];
    releaseDate = map["releaseDate"];
    cover = map["cover"];
    song = map["song"];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
      cover: cover,
      song: song,
    );
  }
}
