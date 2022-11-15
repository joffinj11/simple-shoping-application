import 'package:flutter/material.dart';
import 'package:haatch_in/services/api%20service.dart';

class Allcategory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Category"),centerTitle: true,),
    body: FutureBuilder(
        future: Apiservice().getallcategories(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){

                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Container(padding: EdgeInsets.all(40),
                      child: Center(
                        child: Text(snapshot.data[index].toString().toUpperCase(),style: TextStyle(fontSize: 25),),
                      ),),
                    ),
                  );
                });

          }
          return Center(child: CircularProgressIndicator(),);
        }),
  );
  }
}