import 'package:flutter/material.dart';
import 'package:catalogo_produtos/src/models/item_model.dart';


class CartItemModel {
  final ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });
  totalPrice() => item.price * quantity;
}


