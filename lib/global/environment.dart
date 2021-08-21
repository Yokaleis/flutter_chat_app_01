
import 'dart:io';

class Environment {

  //Metodos estaticos
  static String apiUrl    = Platform.isAndroid ? 'http://10.0.2.2:3000/api/' : 'http://localhost:3000/api/login/';//Servicios REST
  static String socketUrl = Platform.isAndroid ? 'http://10.0.2.2:3000'     : 'http://localhost:3000';//Servicios de SOCKETS
}
