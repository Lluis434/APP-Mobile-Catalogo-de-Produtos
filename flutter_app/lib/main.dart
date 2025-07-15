import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/pages/auth/login.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // Carrega variáveis de ambiente
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Oculta a faixa de debug
      theme: ThemeData(

        primaryColor: Color(0xFF813FF2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF813FF2)),
      ),
      home: const LoginScreen(), // Correção do parêntese e ;
    );
  }
}