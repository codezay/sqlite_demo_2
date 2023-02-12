import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqlite_demo_2/models/song.dart';

// import '../../models/song.dart';

class SongHelper {
  // Database? database;
  SongHelper._privateConstructor();
  static final SongHelper _instance = SongHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    Database? instance = _database;
    if (instance != null) {
      print('Database already exists');
      return instance;
    } else {
      instance = await initializeDataBase();
      return instance;
    }
  }

  Future initializeDataBase() async {
    final databasePath = await getDatabasesPath();
    var path = join(databasePath, "songs.db");
    // check if the data base exists
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "songs.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS sm (id INTEGER PRIMARY KEY, name TEXT, cat TEXT, font TEXT, font2 TEXT, timestamp TEXT, yvideo TEXT, bkgndfname TEXT, key TEXT, copy TEXT, notes TEXT, lyrics TEXT, lyrics2 TEXT, title2 TEXT, tags TEXT, slideseq TEXT, rating TEXT, chordsavailable TEXT, usagecount TEXT, subcat INTEGER)");
        // "CREATE TABLE sm (id INTEGER PRIMARY KEY, name TEXT, cat TEXT, font TEXT, font2 TEXT, timestamp TEXT, yvideo TEXT, bkgndfname TEXT, key TEXT, copy TEXT, notes TEXT, lyrics TEXT, lyrics2 TEXT, title2 TEXT, tags TEXT, slideseq TEXT, rating TEXT, chordsavailable TEXT, usagecount TEXT, subcat INTEGER)");
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getSongs() async {
    Database? db = await _instance.database;
    return await db!.query("sm");
  }

  static Future<List<Song>> getAllSongs() async {
    Database? db = await _instance.database;
    // test
    // Directory directory = await getApplicationDocumentsDirectory();
    // var path_name = directory.path;
    // print('path $path_name');
    // end test
    List<Map> list = await db!.rawQuery('SELECT * FROM sm');
    List<Song> songs = [];
    for (int i = 0; i < list.length; i++) {
      songs.add(Song.fromMap(list[i] as Map<String, dynamic>));
    }
    return songs;
  }
}
