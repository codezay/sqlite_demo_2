// import 'package:sqflite/sqflite.dart';
import 'package:sqlite_demo_2/models/chord.dart';
// import 'package:sqlite_demo_2/models/song.dart';
import 'package:sqlite_demo_2/helpers/db/databse_helper.dart';

class ChordHelper {
  static Future<List<Chord>> getAllChords() async {
    final db = await DatabaseHelper().database;
    List<Map> list = await db!.rawQuery('SELECT * FROM chords');
    List<Chord> chords = [];

    for (int i = 0; i < list.length; i++) {
      chords.add(Chord.fromMap(list[i] as Map<String, dynamic>));
    }

    return chords;
  }
}
