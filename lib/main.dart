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

final routes =
    RouteMap(routes: {'/': (route) => const MaterialPage(child: MyHomePage())});
