import 'package:sqflite/sqflite.dart';

class Transaction {
  static Future<void> createTable(Database db) async {
    await db.execute("""
  CREATE TABLE IF NOT EXISTS productos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre text,
    precio integer,
    referencia text,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
  )
""");
  }

  static Future<Database> database() async {
    return openDatabase(
      'bdproductos.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<Database> db() async {
    return openDatabase('bdproductos.db', version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });
  }

  static Future<int> regProductos(
      String nombre, int precio, String referencia) async {
    final con = await db();
    final datos = {
      "nombre": nombre,
      "precio": precio,
      "referencia": referencia
    };
    final id = await con.insert('productos', datos);
    return id;
  }

  static Future<List<Map<String, Object?>>> listarProductos() async {
    final con = await db();
    return await con.query('productos', orderBy: 'id');
  }

  static Future<int> delete(int id) async {
    final con = await db();
    return await con.delete('productos', where: 'id=?', whereArgs: [id]);
  }

  static Future<int> updateProduct(
      int id, String nombre, int precio, String referencia) async {
    final con = await db();
    final datos = {
      'nombre': nombre,
      'precio': precio,
      'referencia': referencia
    };
    final result =
        con.update('productos', datos, where: 'id=?', whereArgs: [id]);
    return result;
  }
}
