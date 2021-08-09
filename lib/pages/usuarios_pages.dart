import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


import 'package:flutter_application_chat_01/models/usuarios.dart';



class UsuariosPage extends StatefulWidget {

  

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  /* pull_to_refresh: ^2.0.0 */
  RefreshController _refreshController = RefreshController(initialRefresh: false);

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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
        )
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTitle(usuarios[i]), 
      separatorBuilder: (_, i) => Divider(), 
      itemCount: usuarios.length
      );
  }

  ListTile _usuarioListTitle(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
          backgroundColor: Colors.pink[100],
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuario.online ? Color(0xff33FDA8) : Color(0xffFD333F),
              borderRadius: BorderRadius.circular(100)
            ),
          ),
      );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}