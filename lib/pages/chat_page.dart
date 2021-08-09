import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = new TextEditingController();
  final _focusNode      = new FocusNode();

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
                //itemCount: 1,
                itemBuilder: (_, i) => Text('$i'),
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
                onSubmitted: (_){},
                onChanged: (String texto){
                  //Saber cuando alguien esta escribiendo
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
                onPressed: (){},
                )
                :
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                )
            )
          ],
          ),
      )
      );
  }
}