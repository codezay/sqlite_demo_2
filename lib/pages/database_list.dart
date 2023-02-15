import 'package:flutter/material.dart';
import 'package:sqlite_demo_2/helpers/db/song_helper_v2.dart';
import 'package:sqlite_demo_2/models/song.dart';

class DatabaseList extends StatefulWidget {
  const DatabaseList({super.key});

  @override
  State<DatabaseList> createState() => _DatabaseListState();
}

class _DatabaseListState extends State<DatabaseList> {
  List<Song> _songs = [];

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  void _fetchSongs() async {
    // SongHelperV2 SongHelperV2 = SongHelperV2();
    List<Song> songs = await SongHelperV2.getAllSongs();
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_songs[index].name ?? ''),
            subtitle: Text(_songs[index].cat ?? ''),
          );
        },
      ),
    );
  }
}
