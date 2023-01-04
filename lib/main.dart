import 'package:enekeskonyv/song/page.dart';
import 'package:enekeskonyv/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'book_provider.dart';
import 'home_page.dart';
import 'routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookProvider>(
      create: (context) => BookProvider()..initialize(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Énekeskönyv',
        theme: ThemeData.dark(useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
