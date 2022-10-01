final String tableItems = "items";

class ItemsFields {
  static final String id = "_id";
  static final String indicador = "indicador";
  static final String tipo = "tipo";
  static final String produto = "produto";
  static final String area = "area";
}

class Item {
  final int? id;
  final String? indicador;
  final String? tipo;
  final String? produto;
  final String? area;

  Item({
    this.id,
    required this.indicador,
    required this.tipo,
    required this.produto,
    required this.area,
  });

  Item copy({
    int? id,
    String? indicador,
    String? tipo,
    String? produto,
    String? area,
  }) =>
      Item(
        id: id ?? this.id,
        indicador: indicador ?? this.indicador,
        tipo: tipo ?? this.tipo,
        produto: produto ?? this.produto,
        area: area ?? this.area,
      );

  static Item fromJson(Map<String, Object?> json) => Item(
        id: json[ItemsFields.id] as int?,
        indicador: json[ItemsFields.indicador] as String?,
        tipo: json[ItemsFields.tipo] as String?,
        produto: json[ItemsFields.produto] as String?,
        area: json[ItemsFields.area] as String?,
      );

  Map<String, Object?> toJson() => {
        ItemsFields.id: id,
        ItemsFields.indicador: indicador,
        ItemsFields.tipo: tipo,
        ItemsFields.produto: produto,
        ItemsFields.area: area,
      };
}
