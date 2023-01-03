import 'package:enekeskonyv/song/page.dart';
import 'package:enekeskonyv/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'book_provider.dart';
import 'home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Énekeskönyv',
      theme: ThemeData.dark(useMaterial3: true),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}

final routes = RouteMap(routes: {
  '/': (route) => MaterialPage(
      child: ChangeNotifierProvider<BookProvider>(
          create: (_) => BookProvider()..initialize(),
          child: const MyHomePage())),
  '/song/:book/:song': (route) =>
      (Book.values.asNameMap().keys.contains(route.pathParameters['book']) &&
              isSongAvailable(Book.values.byName(route.pathParameters['book']!),
                  int.tryParse(route.pathParameters['song'] ?? '0') ?? 0))
          ? TabPage(
              child: SongPage(
                book: Book.values.byName(route.pathParameters['book']!),
                song: int.parse(route.pathParameters['song']!),
              ),
              paths: getAvailableVersesOfSong(Book.blue, 0)
                  .map((e) => e.toString())
                  .toList(),
              pageBuilder: (child) => MaterialPage(child: child))
          : const NotFound(),
  '/song/:book/:song/:verse': (route) => MaterialPage(
        child: VersePage(
          book: Book.values.byName(route.pathParameters['book']!),
          song: int.parse(route.pathParameters['song']!),
          verse: int.parse(route.pathParameters['verse']!),
        ),
      )
});
