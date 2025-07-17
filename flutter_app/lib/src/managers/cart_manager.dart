import 'package:flutter/foundation.dart';
import 'package:catalogo_produtos/src/models/cart_item_model.dart';
import 'package:catalogo_produtos/src/models/item_model.dart';

class CartManager extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.totalPrice();
    }
    return total;
  }

  void addItem(ItemModel item, int quantity) {
    // Verifica se o item já está no carrinho
    final index = _items.indexWhere((element) => element.item.id == item.id);
    if (index >= 0) {
      // Se existir, atualiza a quantidade
      _items[index].quantity += quantity;
    } else {
      // Se não existir, adiciona novo
      _items.add(CartItemModel(item: item, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(CartItemModel cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void updateQuantity(CartItemModel cartItem, int quantity) {
    if (quantity <= 0) {
      removeItem(cartItem);
    } else {
      final index = _items.indexOf(cartItem);
      if (index >= 0) {
        _items[index].quantity = quantity;
        notifyListeners();
      }
    }
  }
}
