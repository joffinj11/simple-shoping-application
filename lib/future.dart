
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Futurescreen extends StatefulWidget{
  @override
  State<Futurescreen> createState() => _FuturescreenState();
}

class _FuturescreenState extends State<Futurescreen> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("future"),
    ),
    body: Center(
      child: ElevatedButton(onPressed: (){},
      child: Text("Click here"),),
    ),
  );
  }
}
