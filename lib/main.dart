import 'package:flutter/material.dart';
import 'package:healthcare_mania/screens/detail_screen.dart';
import 'package:healthcare_mania/screens/list_screen.dart';
import 'package:healthcare_mania/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Mania',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      restorationScopeId: LoginScreen.id,
      routes: {
    DetailScreen.id:(context) => DetailScreen(),
        ListScreen.id:(context) => ListScreen(),
        LoginScreen.id:(context) => LoginScreen(),
    },
    );
  }
}