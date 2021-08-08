import 'package:flutter/material.dart';



import 'package:flutter_application_chat_01/widgets/custom_inputs.dart';
import 'package:flutter_application_chat_01/widgets/custom_labels.dart';
import 'package:flutter_application_chat_01/widgets/custom_logo.dart';
import 'package:flutter_application_chat_01/widgets/custom_btn.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Logo(),
                _Form(),
                Labels(
                  ruta: 'register',
                  titulo: 'No tienes cuenta?',
                  subtitulo: 'Crea una ahora!',
                ),

                Text('Acepto los términos y condiciones',
                style: TextStyle(
                  fontWeight: FontWeight.w200
                ),
                )
              ],
     ),
          ),
        ),
      ),
   );
  }
}



class _Form extends StatefulWidget {


  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl   = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
       child: Column(
         children: <Widget>[
           CustomInputs(
             icon: Icons.mail_outline_outlined,
             placeholder: 'Correo electrónico',
             keyboardType: TextInputType.emailAddress,
             textController: emailCtrl,
           ),
           CustomInputs(
             icon: Icons.lock_open_outlined,
             placeholder: 'Contraseña',
             isPassword: true,
             textController: passCtrl,
           ),

             Boton(
               text: 'Login',
               onPressed: (){
                 print( emailCtrl);
                 print( passCtrl);
               },
             ),

         ],
         ),
    );
  }
}

