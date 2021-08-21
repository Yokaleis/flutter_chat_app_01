import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:flutter_application_chat_01/routes/routes.dart';
import 'package:flutter_application_chat_01/services/auth_services.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Coleccion o listado de providers, en esta caso solo tengo este.
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ,),//AuthService es una instancia global.
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}