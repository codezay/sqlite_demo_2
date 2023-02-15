import 'package:flutter/material.dart';
import 'package:sqlite_demo_2/helpers/db/chord_helper.dart';
// import 'package:sqlite_demo_2/models/Chord.dart';
import 'package:sqlite_demo_2/models/chord.dart';

class ChordsList extends StatefulWidget {
  const ChordsList({super.key});

  @override
  State<ChordsList> createState() => _ChordsListState();
}

class _ChordsListState extends State<ChordsList> {
  List<Chord> _chords = [];

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  void _fetchSongs() async {
    // SongHelperV2 SongHelperV2 = SongHelperV2();
    List<Chord> chords = await ChordHelper.getAllChords();
    setState(() {
      _chords = chords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _chords.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_chords[index].title ?? ''),
            subtitle: Text(_chords[index].lyrics ?? ''),
          );
        },
      ),
    );
  }
}
