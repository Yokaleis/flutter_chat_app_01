import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto; //El mensaje
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key, 
    required this.texto, 
    required this.uid,
    required this.animationController
  }) : super(key: key); //Mensaje de persona  o mio

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123'
          ?_mymessage()
          :_notMyMessage(),
        ),
      ),
    );
  }

  Widget _mymessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          bottom: 5,
          left: 80,
          right: 5
        ),
        child: Text( this.texto, style: TextStyle(color: Colors.white), ),
        decoration: BoxDecoration(
          color: Color(0xff480ca8),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), 
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15)),
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          bottom: 5,
          right: 80,
          left: 5
        ),
        child: Text( this.texto, style: TextStyle(color: Colors.black87), ),
        decoration: BoxDecoration(
          color: Color(0xffecbcfd),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), 
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15)),
        ),
      ),
    );
  }
}