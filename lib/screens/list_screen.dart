import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget{
  static const String id ='list_screen';
  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext conext){
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Container(),

    );
  }
}