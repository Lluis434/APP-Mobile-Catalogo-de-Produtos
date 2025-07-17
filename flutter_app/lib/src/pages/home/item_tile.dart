import 'package:catalogo_produtos/src/models/item_model.dart';
import 'package:catalogo_produtos/src/pages/product/product_screen.dart';
import 'package:catalogo_produtos/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_produtos/src/config/custom_colors.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({super.key, required this.item});
  // Removido const do construtor


  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navega para ProductScreen passando o item
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductScreen(item: item),
          ),
        );
      },
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      item.imgUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image));
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                // Aqui você pode implementar a ação de adicionar ao carrinho diretamente
              },
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
