class ItemModel {
  final String id;         // Novo campo id
  final String itemName;
  final String imgUrl;
  final String unit;
  final double price;
  final String description;

  ItemModel({
    required this.id,       // adicionado no construtor
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
      id: json['id'].toString(),             // captura o id (ajuste se o nome for diferente)
      description: json['descricao'] ?? '',
      imgUrl: Uri.decodeFull(json['imagem'] ?? ''),
      itemName: json['nome'] ?? '',
      price: parsePrice(json['preco']),
      unit: json['tipo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,                             // adicionado no JSON
      'descricao': description,
      'imagem': imgUrl,
      'nome': itemName,
      'preco': price,
      'tipo': unit,
    };
  }
}
