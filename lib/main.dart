import 'dart:async';

import 'package:deenthusiast/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
  }, (error, trace) {
    print('$error');
    print(trace);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deenthusiast',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
