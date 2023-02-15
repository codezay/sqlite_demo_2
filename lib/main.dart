import 'package:flutter/material.dart';
import 'package:sqlite_demo_2/pages/chords_list.dart';
// import 'package:sqlite_demo_2/pages/song_list.dart';
import 'package:sqlite_demo_2/pages/database_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SongList(),
      // home: const VerseList(),
      // home: const DatabaseList(),
      // home: const ChordsList(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    DatabaseList(),
    ChordsList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          height: 60,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.library_books_outlined),
              selectedIcon: Icon(Icons.library_books_rounded),
              label: 'Verses',
            ),
            NavigationDestination(
              icon: Icon(Icons.music_note_outlined),
              selectedIcon: Icon(Icons.music_note_rounded),
              label: 'Chords',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(milliseconds: 600),
        ),
      ),
    );
  }
}
