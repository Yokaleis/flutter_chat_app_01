import 'package:flutter/material.dart';

class Boton extends StatelessWidget {

  final String text;
  final Function onPressed;

  const Boton({
    Key? key, 
    required this.text, 
    required this.onPressed
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffF72585),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              )
            ),
            onPressed: () => this.onPressed,
            child: Container(
              width: double.infinity,
              height: 55,
              child: Center(
                child: Text(this.text),
                ),
            )
          );
  }
}