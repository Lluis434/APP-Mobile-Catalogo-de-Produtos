import 'package:flutter/material.dart';

class  ProfileTab StatelessWidget {
  const ProfileTab({ Key? key.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold()
    
    AppBar: AppBar(title: const Text('Perfil do usuário'),
    
    actions: [
      IconButton(onPressed: () {},
       icon: const Icon(
       Icons.logout,
       ),)
    ],
    )
    Body: ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16), 
      children: const [
        CustomTextField(
          icon: Icons.persona,
          label: 'Nome'
        ),

        //Nome 
      CustomTextField(
          icon: Icons.,email,
          label: 'Email'
        ),

      
        // Atualizar a senha 
        
      ],
    );
  }
}