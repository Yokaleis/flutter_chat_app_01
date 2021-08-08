import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget> [
            Image(image: AssetImage('assets/venus.png') ),
            SizedBox(height: 10,),
            Text('Venus Chat', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
        ],
        ),
      ),
    );
  }
}