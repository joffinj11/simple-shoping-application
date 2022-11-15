import 'package:flutter/material.dart';
import 'package:haatch_in/screens/all%20category.dart';
import 'package:haatch_in/screens/productdetail.screen.dart';
import 'package:haatch_in/services/api%20service.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFbdb76b),
        actions: [IconButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Allcategory()));
        }, icon: Icon(Icons.view_list))
        ],
      ),
      body: FutureBuilder(
          future: Apiservice().getallposts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: Container(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                            contentPadding: EdgeInsets.fromLTRB(15, 50, 15, 50),
                            horizontalTitleGap: 55,
                            tileColor: Color(0xFF99aab5),
                            leading: Image.network(
                              snapshot.data[index]['image'],
                              height: 50,
                              width: 50,
                            ),
                            title: Text(snapshot.data[index]['title']),
                            subtitle: Text(
                              "Price - \$ " +
                                  snapshot.data[index]['price'].toString(),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Productdetail(
                                              snapshot.data[index]['id'])));
                            },
                          );
                        }),
                  ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      backgroundColor: Color(0xFF989244),
    );
  }
}
