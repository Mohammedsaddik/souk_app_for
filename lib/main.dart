
import 'package:flutter/material.dart';
import 'package:souk_app/Modules/home_screen.dart';
import 'package:souk_app/Modules/update_product_screen.dart';
void main()async
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      routes:
      {
        '/update': (context) => UpdateScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
