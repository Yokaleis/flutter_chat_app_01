import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;
  final String titulo;
  final String subtitulo;

  const Labels({
    Key key, 
    @required this.ruta,
    @required this.titulo,
    @required this.subtitulo,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.titulo,
            style: TextStyle(
            fontSize: 14, 
            color: Color(0xffb1b1b1),
            fontWeight: FontWeight.normal,
            ),
            ),
            SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.subtitulo, 
            style: TextStyle(
              fontSize: 18, 
              color: Color(0xff3A0CA3),
              fontWeight: FontWeight.bold,
              ),
              ),
              onTap: (){
                Navigator.pushReplacementNamed(context, this.ruta);
              },
          ),
        ],
        ),
    );
  }
}