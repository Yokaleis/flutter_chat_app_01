import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_chat_01/widgets/chat_message.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = new TextEditingController();
  final _focusNode      = new FocusNode();

  List<ChatMessage> _message = [
    
  ];

  bool _enviandomensaje = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text('SE', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.pink[100],
              ),
              //Text('Samir'),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_, i) => _message[i],
                reverse: true,
              ),),

              Divider(height: 1,),

              Container(
                child: _inputChat(),
              ),
          ],
        ),
      ),
   );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  //Saber cuando alguien esta escribiendo
                  setState(() {
                    if( texto.trim().length > 0){
                      _enviandomensaje = true;
                    }else{
                      _enviandomensaje = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Escribe tu mensaje'
                  ),
                  focusNode: _focusNode,
              )
            ),
            //BOTON SEND
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
              ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed: _enviandomensaje ? () => _handleSubmit( _textController.text.trim()) : null,
                )
                :
                //BOTON ANDROID
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.pinkAccent),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.send),
                      onPressed: _enviandomensaje ? () => _handleSubmit( _textController.text.trim()) : null,
                    ),
                  ),
                )
            )
          ],
          ),
      )
      );
  }

  _handleSubmit(String texto){
    
    //Validacion para no enviar mensajes vacios
    if(texto.length == 0) return;


    print(texto);
    _focusNode.requestFocus();
    _textController.clear();

    final newMessage = new ChatMessage( 
      uid: '123', 
      texto: texto,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 400),
      ),
      );
    _message.insert(0, newMessage);
    newMessage.animationController.forward();//Dispara el proceso de animacion.


    setState(() {
          _enviandomensaje = false;
        });

  }

  //DISPOSE

  //CANCELAR LA ESCUCHA DEL SOCKET EN UN CHAT EN PARTICULAR

  
  @override void dispose(){

    for( ChatMessage message in _message ){
      message.animationController.dispose();
    }
    super.dispose();
  }


}