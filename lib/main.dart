import 'package:flutter/material.dart';
import 'package:movie_db/skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie DB",
      debugShowCheckedModeBanner: false,
      home: const Skeleton(),
      theme: ThemeData.dark(),
    );
  }
}
