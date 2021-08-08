import 'package:flutter/material.dart';
import 'package:flutter_application_chat_01/models/usuarios.dart';


class UsuariosPage extends StatefulWidget {

  

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final usuarios = [
    Usuario(uid: '1', nombre: 'Lorena', email: 'lorenatrilliza@hotmail.com', online: true),
    Usuario(uid: '2', nombre: 'Carol', email: 'caroltrilliza@hotmail.com', online: false),
    Usuario(uid: '3', nombre: 'Valentina', email: 'valentinatrilliza@hotmail.com', online: true),
    Usuario(uid: '4', nombre: 'Yokasta', email: 'yokastina@gmail.com', online: true),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre de Ususario',
        style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black87),
          onPressed: (){},
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle_outline, color: Color(0xff4cc9f0)),
            //child: Icon(Icons.check_circle_outline, color: Color(0xfff72585)),
          )
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
          title: Text(usuarios[i].nombre),
          leading: CircleAvatar(
            child: Text(usuarios[i].nombre.substring(0,2)),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: usuarios[i].online ? Color(0xff33FDA8) : Color(0xffFD333F),
                borderRadius: BorderRadius.circular(100)
              ),
            ),
        ), 
        separatorBuilder: (_, i) => Divider(), 
        itemCount: usuarios.length
        )
   );
  }
}