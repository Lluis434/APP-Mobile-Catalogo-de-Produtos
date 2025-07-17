class ItemModel {
  final String itemName;
  final String imgUrl;
  final String unit;
  final double price;
  final String description;

  ItemModel({
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    double parsePrice(dynamic value) {
      if (value is int) {
        return value.toDouble();
      } else if (value is double) {
        return value;
      } else if (value is String) {
        return double.tryParse(value) ?? 0.0;
      } else {
        return 0.0;
      }
    }

    return ItemModel(
      description: json['descricao'] ?? '',
      imgUrl: json['imagem'] ?? '',
      itemName: json['nome'] ?? '',
      price: parsePrice(json['preco']),
      unit: json['tipo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': description,
      'imagem': imgUrl,
      'nome': itemName,
      'preco': price,
      'tipo': unit,
    };
  }
}
