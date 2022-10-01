import 'package:sprint3_app/model/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ItemsDatabase {
  static final ItemsDatabase instance = ItemsDatabase._init();

  static Database? _database;

  ItemsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('items.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableItems ( 
        ${ItemsFields.id} $idType,
        ${ItemsFields.indicador} $textType,
        ${ItemsFields.tipo} $textType,
        ${ItemsFields.produto} $textType,
        ${ItemsFields.area} $textType
      )
    ''');
  }

  Future<Item> create(Item item) async {
    final db = await instance.database;

    final id = await db.insert(tableItems, item.toJson());
    return item.copy(id: id);
  }

  Future<List<Item>> readAllItems() async {
    final db = await instance.database;

    final result = await db.query(tableItems);

    return result.map((json) => Item.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
