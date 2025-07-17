import 'package:catalogo_produtos/src/pages/auth/login.dart';
import 'package:catalogo_produtos/src/pages/home/home_tab.dart';  
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/pages/base/base_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: const Color(0xFF813FF2),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF813FF2)),
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const BaseScreen(),  
        '/login': (context) => const LoginScreen(),
        
      },
    );
  }
}
