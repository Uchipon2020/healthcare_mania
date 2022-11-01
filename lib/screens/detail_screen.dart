import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
 static const String id = 'detail_screen';
 @override
 DetailScreenState createState() => DetailScreenState();
}
class DetailScreenState extends State<DetailScreen>{
 @override
 Widget build(BuildContext context){
  return Scaffold(
   appBar: AppBar(
    title: const Text(' '),
   ),
   body: Container(),
  );
 }
}