// import 'package:sqflite/sqflite.dart';
import 'package:sqlite_demo_2/models/song.dart';
import 'package:sqlite_demo_2/helpers/db/databse_helper.dart';

class SongHelperV2 {
  static Future<List<Song>> getAllSongs() async {
    final db = await DatabaseHelper().database;
    List<Map> list = await db!.rawQuery('SELECT * FROM songs');
    List<Song> songs = [];

    for (int i = 0; i < list.length; i++) {
      songs.add(Song.fromMap(list[i] as Map<String, dynamic>));
    }

    return songs;
  }
}
