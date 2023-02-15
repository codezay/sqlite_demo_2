import 'package:flutter/material.dart';
import 'package:sqlite_demo_2/helpers/db/verse_helper.dart';
import 'package:sqlite_demo_2/models/song.dart';

class VerseList extends StatefulWidget {
  const VerseList({super.key});

  @override
  State<VerseList> createState() => _VerseListState();
}

class _VerseListState extends State<VerseList> {
  List<Song> _songs = [];

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  void _fetchSongs() async {
    // VerseHelper VerseHelper = VerseHelper();
    List<Song> songs = await VerseHelper.getAllSongs();
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
