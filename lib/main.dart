import 'package:exam/screen/homepage.dart';
import 'package:exam/screen/register.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MyApp(),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
