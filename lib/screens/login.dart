import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
    AppBar,
    BuildContext,
    Colors,
    Column,
    Container,
    CrossAxisAlignment,
    EdgeInsets,
    ElevatedButton,
    InputDecoration,
    MainAxisAlignment,
    MaterialPageRoute,
    MediaQuery,
    OutlineInputBorder,
    Scaffold,
    ScaffoldMessenger,
    SizedBox,
    SnackBar,
    StatelessWidget,
    Text,
    TextEditingController,
    TextField,
    TextStyle,
    Widget;
import 'package:haatch_in/screens/home.dart';
import 'package:haatch_in/services/api%20service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController nameController =
  TextEditingController(text: "mor_2314");
  TextEditingController passwordContrller =
  TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login  "),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "USER NAME", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordContrller,
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: ElevatedButton(
                  onPressed: () async {
                    final getToken = await Apiservice()
                        .userLogin(nameController.text, passwordContrller.text);

                    if (getToken['token'] != null) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Sucess")));
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>
                            Loginpage()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Sucess"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ), Text("remember me", style: TextStyle(color: Colors.black),)
           
          ],
        ),
      ),
    );
  }
}
