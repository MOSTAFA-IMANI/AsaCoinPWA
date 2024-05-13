import 'package:asacoine/src/home/home.dart';
import 'package:asacoine/src/webview/web_view.dart';
import 'package:asacoine/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    MaterialTheme materialTheme = MaterialTheme(textTheme);

    final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeWidget(),
          ),
        ],
        errorBuilder: ((context, state) {
          if (state.uri.toString().isNotEmpty) {
            return WebViewApp(url: state.uri.toString());
          }
          return const Text("not found");
        }));

    return MaterialApp.router(
      routerConfig: router,
      theme: materialTheme.dark(),
      darkTheme: materialTheme.dark(),
    );
  }
}
