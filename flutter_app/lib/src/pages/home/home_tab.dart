import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catalogo_produtos/src/config/custom_colors.dart';
import 'package:catalogo_produtos/src/pages/home/components/category_tile.dart';
import 'package:catalogo_produtos/src/pages/home/item_tile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:catalogo_produtos/src/models/item_model.dart'; // importe o model

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'todos';
  List<String> categorias = []; // categorias dinâmicas da API
  List<ItemModel> produtos = [];
  bool carregando = false;
  bool carregandoCategorias = true;

  @override
  void initState() {
    super.initState();
    buscarCategorias();
  }

  Future<void> buscarCategorias() async {
    setState(() => carregandoCategorias = true);

    final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:5000';
    final uri = Uri.parse('$apiUrl/produtos/categorias');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        categorias = data.map((e) => e.toString()).toList();

        if (!categorias.contains('todos')) {
          categorias.insert(0, 'todos');
        }

        selectedCategory = categorias.first;

        await buscarProdutos();
      } else {
        categorias = ['todos'];
        selectedCategory = 'todos';
      }
    } catch (e) {
      categorias = ['todos'];
      selectedCategory = 'todos';
    } finally {
      setState(() => carregandoCategorias = false);
    }
  }

  Future<void> buscarProdutos() async {
    setState(() {
      carregando = true;
    });

    final apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:5000';
    final uri = Uri.parse('$apiUrl/produtos/').replace(queryParameters: {
      if (selectedCategory != 'todos') 'tipo': selectedCategory,
    });

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          produtos = data.map((json) => ItemModel.fromJson(json)).toList();
        });
      } else {
        setState(() {
          produtos = [];
        });
      }
    } catch (e) {
      setState(() {
        produtos = [];
      });
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Maliu',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF813FF2),
          ),
        ),
        actions: [
          Badge(
            backgroundColor: Colors.red,
            label: const Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: CustomColors.customSwatchColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          if (carregandoCategorias)
            const Center(child: CircularProgressIndicator())
          else
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, index) {
                  final category = categorias[index];
                  return CategoryTile(
                    category: category,
                    isSelected: category == selectedCategory,
                    onPressed: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      buscarProdutos();
                    },
                  );
                },
              ),
            ),
          Expanded(
            child: carregando
                ? const Center(child: CircularProgressIndicator())
                : produtos.isEmpty
                    ? const Center(child: Text('Nenhum produto encontrado'))
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: produtos.length,
                        itemBuilder: (_, index) {
                          final produto = produtos[index];
                          return ItemTile(
                            item: produto,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
