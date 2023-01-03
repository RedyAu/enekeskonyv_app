import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../book_provider.dart';

class SongPage extends StatefulWidget {
  final Book book;
  final int song;
  final int verse;
  const SongPage({
    required this.book,
    required this.song,
    required this.verse,
    Key? key,
  }) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    print('inited state');
    super.initState();
  }

  @override
  void dispose() {
    print('disposed of state');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.toString())),
      body: Center(
        child: Column(
          children: [
            Text('Book ${widget.book}'),
            Text('Verse ${widget.verse}'),
            MaterialButton(
              child: Text('Next song'),
              onPressed: (() {
                print('next song');
                Routemaster.of(context)
                    .replace('/song/${widget.book.name}/${widget.song + 1}/1');
              }),
            ),
            MaterialButton(
              child: Text('Next verse'),
              onPressed: (() {
                print('next verse');
                Routemaster.of(context).replace(
                    '/song/${widget.book.name}/${widget.song}/${widget.verse + 1}');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
