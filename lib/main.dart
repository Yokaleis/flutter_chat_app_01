import 'package:flutter/material.dart';
import 'package:flutter_application_chat_01/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'usuarios',
      routes: appRoutes,
    );
  }
}