import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'modal/userdata.dart';


class AppString{
  static bool isValidator = false;
  static List data = [];
  static var title = GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),);
  static var titlemediam = GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),);
  static var titlesmall = GoogleFonts.lato(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 12),);
}

class Controller
{
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();

  static String email = "";
  static String password = "";
  static String conformPassword = "";
}


class HttpService {
   getRegisterData() async {
     var url = Uri.parse("https://reqres.in/api/register");
     var response = await http.post(url,body: {
       'email': 'eve.holt@reqres.in',
       "password": 'pistol'
     });

    try
    {
      if (response.statusCode == 200) {
        AppString.data.addAll(
          [
            {
              'id' : jsonDecode(response.body)['id'],
              'token' : jsonDecode(response.body)['token'],
            }
          ]
        );

      }
    }
     catch(e) {
      print(e.toString());

    }
  }
   Future<List<UserData>> getUserData() async {
    Response response =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => UserData.fromJson(e)).toList();
    } else {
      print(response.statusCode);
      throw "Unable to retrieve posts.";
    }
  }
}