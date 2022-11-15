import 'package:flutter/material.dart';
import 'package:haatch_in/services/api%20service.dart';

class Productdetail extends StatelessWidget {
  final int id;

  Productdetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
      ),
      body: FutureBuilder(
        future: Apiservice().getsingleposts(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Image.network(
                    snapshot.data['image'],
                    height: 200,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.00, right: 30.00),
                    child: Center(
                        child: Text(
                      snapshot.data['title'],
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Center(
                          child: Text(
                    "\$" + snapshot.data['price'].toString(),
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ))),
                  SizedBox(
                    height: 25,
                  ),
                  Chip(
                    label: Text(
                      snapshot.data['category'].toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(height: 35,),
                  Center(child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(snapshot.data['description'].toString(),style: TextStyle(fontSize: 16,color: Colors.black),),
                  ))
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_rounded),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
