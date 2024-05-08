import 'package:asacoine/src/home/home.dart';
import 'package:asacoine/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    MaterialTheme materialTheme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: materialTheme.dark(),
      darkTheme: materialTheme.dark(),
      home: const HomeWidget(),
    );
  }
}
