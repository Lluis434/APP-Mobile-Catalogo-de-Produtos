import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static final String baseUrl = dotenv.env['API_URL'] ?? '';

  static Future<Map<String, dynamic>> registerUser({
    required String nome,
    required String email,
    required String senha,
    required String confirmaSenha,
  }) async {
    final url = Uri.parse('$baseUrl/auth/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nome': nome,
          'email': email,
          'senha': senha,
          'confirma_senha': confirmaSenha,
        }),
      );

      final data = json.decode(response.body);
      return {
        'status': response.statusCode,
        'data': data,
      };
    } catch (e) {
      return {
        'status': 500,
        'data': {'error': 'Erro de conexão com o servidor.'}
      };
    }
  }
}
