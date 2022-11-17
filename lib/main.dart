import 'package:flutter/material.dart';
import 'package:healthcare_mania/screens/detail_screen.dart';
import 'package:healthcare_mania/screens/login_screen.dart';

import 'screens/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare Mania',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(),
      restorationScopeId: LoginScreen.id,
      routes: {
        DetailScreen.id: (BuildContext context) => const DetailScreen(),
        ListScreen.id: (BuildContext context) => const ListScreen(),
        LoginScreen.id: (BuildContext context) => const LoginScreen(),
        DetailScreen.id:(BuildContext context) => const DetailScreen(),
      },
    );
  }
}
