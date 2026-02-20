import 'package:flutter/material.dart';
import 'screens/login_first.dart';
import 'screens/login_second.dart';
import 'screens/login_third.dart';
import 'screens/login_fourth.dart';
import 'screens/login_fifth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umerch',
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/second': (ctx) => const HomeScreen2(),
        '/third': (ctx) => const HomeScreen3(),
        '/fourth': (ctx) => const HomeScreen4(),
        '/fifth': (ctx) => const HomeScreen5(),
      },
    );
  }
}
