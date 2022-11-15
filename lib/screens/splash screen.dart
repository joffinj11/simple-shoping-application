import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 255.00),
                child: Image(
                  height: 200,
                    width: 200,
                    image: AssetImage(
                        "assets/png/Artboard 1_1@2x.png")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 270.00),
                child: Text("Money Wallet",style:TextStyle(color: Colors.black26),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
