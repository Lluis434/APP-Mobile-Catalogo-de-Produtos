import 'package:catalogo_produtos/src/models/item_model.dart';

final ItemModel moletom1 = ItemModel(
  description: 'Moletom Preto da banda Twenty opne pilots ano de 2024',
  imgUrl: 'assets/imagens/Moletom1.png',  // Use barras normais '/' para caminhos no Flutter
  itemName: 'Moletom Sahlo Folina',
  price: 180.90, // preço como String, se o seu modelo espera String
  unit: 'reais',
);

final ItemModel moletom2 = ItemModel(
  description: 'Moletom Preto da banda Twenty opne pilots ano de 2024',
  imgUrl: 'assets/imagens/Moletom1.png',
  itemName: 'Moletom Sahlo Folina',
  price: 180.99,
  unit: 'reais',
);

final ItemModel moletom3 = ItemModel(
  description: 'Moletom Sahlo Folina',
  imgUrl: 'assets/imagens/Moletom1.png',
  itemName: 'Moletom',
  price: 200,
  unit: 'reais',
);

final ItemModel moletom4 = ItemModel(
  description: 'Moletom Sahlo Folina',
  imgUrl: 'assets/imagens/Moletom1.png',
  itemName: 'Moletom',
  price: 180,
  unit: 'reais',
);

final ItemModel moletom5 = ItemModel(
  description: 'Moletom Sahlo Folina',
  imgUrl: 'assets/imagens/Moletom1.png',
  itemName: 'Moletom',
  price: 290.90,
  unit: 'reais',
);

final List<ItemModel> items = [
  moletom1,
  moletom2,
  moletom3,
  moletom4,
  moletom5,
];

final List<String> categories = [
  'Moletom',
  'Blusas',
  'Calças',
  'Sapatos',
  'Vestidos',
];
