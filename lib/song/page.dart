/*import 'package:enekeskonyv/util.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../book_provider.dart';

// @see https://pub.dev/packages/routemaster#tabs
// @see https://github.com/tomgilder/routemaster/blob/v1.0.1/example/book_store/lib/audiobooks_page.dart
class SongPage extends StatelessWidget {
  final Book book;
  final int song;
  SongPage({
    required this.book,
    required this.song,
    Key? key,
  }) : super(key: key);

  int i = 0;

  @override
  Widget build(BuildContext context) {
    var tabState = TabPage.of(context);
    int verse;
    try {
      verse =
          int.parse(Routemaster.of(context).currentRoute.path.split('/')[4]);
    } catch (_) {
      verse = 1;
    }
    i++;
    return Scaffold(
      appBar: AppBar(title: Text(song.toString())),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
                controller: tabState.controller,
                children: getAvailableVersesOfSong(book, song)
                    .map((verse) => PageStackNavigator(
                        stack:
                            tabState.stacks[indexOfVerse(book, song, verse)]))
                    .toList()),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SongPage State:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('Book $book'),
              Text('Song $song'),
              Text('Verse directly from path $verse'),
              Text('Build $i'),
              Text('Hash $hashCode'),
            ],
          ),
          TabBar(
            controller: tabState.controller,
            tabs: getAvailableVersesOfSong(book, song)
                .map((verse) => Tab(
                      child: Text(verse.toString()),
                    ))
                .toList(),
          ),
          Row(
            children: [
              MaterialButton(
                child: Text('Next song'),
                onPressed: (() {
                  print('next song');
                  Routemaster.of(context)
                      .replace('/song/${book.name}/${song + 1}/1');
                }),
              ),
              MaterialButton(
                child: Text('Next verse'),
                onPressed: (() {
                  print('next verse');
                  Routemaster.of(context)
                      .replace('/song/${book.name}/$song/${verse + 1}');
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// @see https://pub.dev/packages/routemaster#tabs
// @see https://github.com/tomgilder/routemaster/blob/v1.0.1/example/book_store/lib/audiobooks_page.dart
class VersePage extends StatelessWidget {
  final Book book;
  final int song;
  final int verse;
  VersePage({
    required this.book,
    required this.song,
    required this.verse,
    Key? key,
  }) : super(key: key);

  int i = 0;

  @override
  Widget build(BuildContext context) {
    i++;

    int actualVerse;
    try {
      actualVerse =
          int.parse(Routemaster.of(context).currentRoute.path.split('/')[4]);
    } catch (_) {
      actualVerse = 1;
    }

    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Text(
            'VersePage State:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text('Book $book'),
          Text('Song $song'),
          Text('Verse from Routemaster $verse'),
          Text('Verse directly from path $actualVerse'),
          Text('Build $i'),
          Text('Hash $hashCode'),
        ],
      ),
    );
  }
}
*/