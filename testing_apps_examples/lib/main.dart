import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_apps_examples/screens/favoritespage.dart';
import 'package:testing_apps_examples/screens/homepage.dart';
import 'models/favorites.dart';

void main() {
  runApp(TestingApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: FavoritesPage.routeName,
            builder: (context, state) => const FavoritesPage(),
          ),
        ],
      ),
    ],
  );
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Favorites>(
        create: (context) => Favorites(),
        child: MaterialApp.router(
          title: "Testing Samples Pro",
          theme: ThemeData(
            colorSchemeSeed: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routerConfig: router(),
        ),
      ),
    );
  }
}
