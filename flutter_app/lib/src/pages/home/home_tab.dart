import 'package:flutter/material.dart';
import 'package:catalogo_produtos/src/config/custom_colors.dart';
import 'package:catalogo_produtos/src/pages/home/components/category_tile.dart';
import 'package:catalogo_produtos/src/pages/home/item_tile.dart';
import 'package:catalogo_produtos/src/config/app_data.dart' as appData;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // Categoria selecionada
  String selectedCategory = appData.categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------- APP BAR ----------
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Maliu',
          style: TextStyle(fontSize: 30),
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

      // ---------- BODY ----------
      body: Column(
        children: [
          // Campo de pesquisa
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

          // Lista horizontal de categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: appData.categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, index) {
                final category = appData.categories[index];
                return CategoryTile(
                  category: category,
                  isSelected: category == selectedCategory,
                  onPressed: () {
                    setState(() => selectedCategory = category);
                  },
                );
              },
            ),
          ),

          // ---------- GRID ----------
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                // Aqui você pode filtrar por categoria se desejar
                return ItemTile(
                  item: appData.items[
                    index
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
