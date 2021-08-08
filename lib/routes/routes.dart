import 'package:flutter/material.dart';

import 'package:flutter_application_chat_01/pages/loading_page.dart';
import 'package:flutter_application_chat_01/pages/login_page.dart';
import 'package:flutter_application_chat_01/pages/register_page.dart';
import 'package:flutter_application_chat_01/pages/usuarios_pages.dart';
import 'package:flutter_application_chat_01/pages/chat_page.dart';



final Map<String, Widget Function(BuildContext)> appRoutes = {

  'usuarios'    : ( _ ) => UsuariosPage(),
  'chat'        : ( _ ) => ChatPage(),
  'login'       : ( _ ) => LoginPage(),
  'register'    : ( _ ) => RegisterPage(),
  'loading'     : ( _ ) => LoadingPage(),

};