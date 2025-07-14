import 'package:catalogo_produtos/src/config/custom_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SingnUpScreen extends StatelessWidget {
  const SingnUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      body:Column(children: [
        const Expanded(
          child: Center(
            child: Text('Cadastro',
            style: TextStyle(
              color:Colors.white,
              fontSize:35,)),
          ),
        ),
        //Formulário 
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 40,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
          ),
        ),
      ],),
    );
  }
}