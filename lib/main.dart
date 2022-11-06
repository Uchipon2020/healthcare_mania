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
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
      restorationScopeId: LoginScreen.id,
      routes: {
        DetailScreen.id: (context) => DetailScreen(),
        ListScreen.id: (context) => ListScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
