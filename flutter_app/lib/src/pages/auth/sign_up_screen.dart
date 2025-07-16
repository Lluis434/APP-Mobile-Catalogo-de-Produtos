import 'package:flutter/material.dart';
import 'package:catalogo_produtos/src/auth/components/custom_text_field.dart';
import 'package:catalogo_produtos/src/config/custom_colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';  // Import dotenv
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmaSenhaController = TextEditingController();

  Future<void> cadastrarUsuario() async {
    final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:5000';
    final url = Uri.parse('$apiUrl/auth/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nome': nomeController.text,
          'email': emailController.text,
          'senha': senhaController.text,
          'confirma_senha': confirmaSenhaController.text,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _mostrarDialogo('Sucesso', responseData['message'] ?? 'Usuário cadastrado com sucesso!');
      } else {
        _mostrarDialogo('Erro', responseData['error'] ?? 'Erro inesperado');
      }
    } catch (e) {
      _mostrarDialogo('Erro', 'Erro de conexão com o servidor.');
    }
  }

  void _mostrarDialogo(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmaSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Nome',
                          controller: nomeController,
                        ),
                        CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                          controller: emailController,
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Crie sua senha',
                          isSecret: true,
                          controller: senhaController,
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Confirme sua senha',
                          isSecret: true,
                          controller: confirmaSenhaController,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF813FF2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: cadastrarUsuario,
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
