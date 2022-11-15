import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class Apiservice{

  Future getallposts()async{
    final allproducturl = Uri.parse( "https://fakestoreapi.com/products");
    final response = await http.get(allproducturl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getsingleposts(int id)async{
    final singleproducturl = Uri.parse( "https://fakestoreapi.com/products/$id");
    final response = await http.get(singleproducturl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getallcategories()async{
    final Categoryurl = Uri.parse( "https://fakestoreapi.com/products/categories");
    final response = await http.get(Categoryurl);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  //post request

Future userLogin(String username,String password)async{
    final loginurl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginurl,body: {
      'username': username,
      'password':password,
    });

    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);

}


}