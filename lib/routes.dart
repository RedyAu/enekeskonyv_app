import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey();

/*
Final plan (at some point in the future):
GoRouter /song/:num/:verse
  -> song_page: legenerálja, kezeli a tabokat
    Ha tab változás van, frissíti a pathet, egyébként hasonlóan működik mint most
  Dallista: Tudja használni ezt az útvonalat egy másik navigatoron belül
*/


final router = GoRouter(
  // TODO Disable me.
  debugLogDiagnostics: kDebugMode,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => TestPage(
        title: 'Shell thingy',
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'TabBarView test page'),
              onFieldSubmitted: (value) => context.go('/tabs/$value'),
            ),
            Expanded(child: child)
          ],
        ),
      ),
      routes: [
        GoRoute(
          path: '/song',
          builder: (context, state) => TestPage(
            title: '/song',
            child: Column(
              children: [
                MaterialButton(
                  child: Text('To /hello'),
                  onPressed: () => context.go('/hello'),
                ),
                MaterialButton(
                  child: Text('To /'),
                  onPressed: () => context.go('/'),
                ),
              ],
            ),
          ),
        ),
        GoRoute(
          path: '/hello',
          builder: (context, state) => TestPage(
            title: '/hello',
            child: MaterialButton(
              child: Text('To /song'),
              onPressed: () => context.go('/song'),
            ),
          ),
        ),
        GoRoute(
            path: '/tabs/:num',
            builder: (context, state) => TestPageWithTabs(
                  tabNum: int.parse(state.params['num']!),
                ))
      ],
    )
  ],
);

class TestPage extends StatelessWidget {
  final String title;
  final String content;
  final Widget? child;
  const TestPage({this.title = "", this.content = "", this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child ?? Center(child: Text(content)),
    );
  }
}

class TestPageWithTabs extends StatelessWidget {
  final int tabNum;
  const TestPageWithTabs({required this.tabNum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TabBar page')),
      body: DefaultTabController(
        initialIndex: tabNum,
        length: 5,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: List.generate(
                  5,
                  (index) => Center(
                    child: Text(index.toString()),
                  ),
                ),
              ),
            ),
            TabBar(
              tabs: List.generate(
                5,
                (index) => Tab(
                  text: index.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
