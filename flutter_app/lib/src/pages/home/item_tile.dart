import 'package:catalogo_produtos/src/models/item_model.dart';
import 'package:catalogo_produtos/src/pages/product/product_screen.dart';
import 'package:catalogo_produtos/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_produtos/src/config/custom_colors.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  // Removido 'const' do construtor, conforme seu código original.
  // Se 'UtilsServices' puder ser uma instância constante, você pode adicionar 'const' de volta.
  ItemTile({super.key, required this.item});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela para cálculo de responsividade
    final screenWidth = MediaQuery.of(context).size.width;

    // Define um fator de escala baseado na largura da tela.
    // O valor '400.0' é uma largura de referência (ex: largura de um celular padrão).
    // Você pode ajustar este valor e a lógica de escala.
    double scaleFactor = screenWidth / 400.0;

    // Limita o fator de escala para evitar que os elementos fiquem muito grandes ou muito pequenos.
    // Ajuste os valores '0.8' (mínimo) e '1.2' (máximo) conforme a necessidade visual.
    scaleFactor = scaleFactor.clamp(0.8, 1.2); // Exemplo: de 80% a 120% do tamanho base

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
              padding: const EdgeInsets.all(12), // Padding fixo geralmente funciona bem para cards
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem do produto
                  Expanded(
                    child: Image.network(
                      item.imgUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image));
                      },
                    ),
                  ),
                  const SizedBox(height: 8), // Espaçamento fixo, geralmente ok
                  // Nome do produto
                  Text(
                    item.itemName,
                    style: TextStyle(
                      fontSize: 14 * scaleFactor, // Tamanho da fonte escalado
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2, // Limita a 2 linhas para evitar overflow
                    overflow: TextOverflow.ellipsis, // Adiciona '...' se o texto for muito longo
                  ),
                  const SizedBox(height: 4), // Espaçamento fixo, geralmente ok
                  // Preço e Unidade
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14 * scaleFactor, // Tamanho da fonte escalado
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 10 * scaleFactor, // Tamanho da fonte escalado
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Botão de adicionar ao carrinho
          Positioned(
            // Posição fixa, mas o tamanho do botão será escalado
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                // Implemente a ação de adicionar ao carrinho aqui
              },
              child: Container(
                height: 40 * scaleFactor, // Altura escalada
                width: 35 * scaleFactor, // Largura escalada
                decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20 * scaleFactor, // Tamanho do ícone escalado
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
