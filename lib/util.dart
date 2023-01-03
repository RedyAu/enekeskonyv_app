import 'dart:collection';

import 'book_provider.dart';

String getSongTitle(LinkedHashMap song) {
  return (song['number'] != null ? song['number'] + ': ' : '') + song['title'];
}

//! FOR PROOF OF CONCEPT!
// TODO implement all of these:
List<int> getAvailableVersesOfSong(Book book, int song) => [1, 2, 3, 4, 5];

int getLastVerseOfSong(Book book, int song) => 5;

bool isSongAvailable(Book book, int song) => true;

bool isVerseAvailable(Book book, int song, int verse) => true;

/// Returns null if there is no next song.
int? getNextSong(Book book, int song) => song + 1;

/// Returns null if there is no previous song.
int? getPreviousSong(Book book, int song) => song - 1;

/// Returns the 0-indexed place of the songID in the song list.
int indexOfSong(Book book, int song) => song - 1;

/// Returns the 0-indexed place of the verse in the given song.
int indexOfVerse(Book book, int song, int verse) => verse - 1;
