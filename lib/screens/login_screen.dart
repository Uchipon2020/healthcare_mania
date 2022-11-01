import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  static const String id ='login_screen';
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext conext){
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Container(),
    );
  }
}