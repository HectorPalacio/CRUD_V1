import 'dart:io';

import 'package:crud_v1/src/models/cliente_model.dart';
export 'package:crud_v1/src/models/cliente_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ClientesDB.db');

    return await openDatabase(
      path,
      version: 3,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Clientes ('
            ' id INTEGER PRIMARY KEY,'
            ' nombre TEXT,'
            ' telefono TEXT,'
            ' email TEXT,'
            ' edad INTEGER'
            ')');
      },
    );
  }

  crearTabla() async {
    final db = await database;
    final res = await db.execute('CREATE TABLE Clientes ('
        ' id INTEGER PRIMARY KEY,'
        ' nombre TEXT,'
        ' telefono TEXT,'
        ' email TEXT,'
        ' edad INTEGER'
        ')');
    return res;
  }

  borrarTabla() async {
    final db = await database;
    final res = await db.execute('DROP TABLE Clientes');
    return res;
  }

  //Registrar cliente
  nuevoCliente(ClienteModel nuevoCliente) async {
    final db = await database;
    final res = await db.insert('Clientes', nuevoCliente.toJson());
    return res;
  }

  //Buscar cliente por ID
  Future<ClienteModel> getClienteId(int id) async {
    final db = await database;
    final res = await db.query('Clientes', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ClienteModel.fromJson(res.first) : null;
  }

  //Consultar todos
  Future<List<ClienteModel>> getTodosClientes() async {
    final db = await database;
    final res = await db.query('Clientes');

    List<ClienteModel> list =
        res.isNotEmpty ? res.map((c) => ClienteModel.fromJson(c)).toList() : [];
    return list;
  }

  //Actualizar cliente por ID
  Future<int> updateCliente(ClienteModel nuevoCliente) async {
    final db = await database;
    final res = await db.update('Clientes', nuevoCliente.toJson(),
        where: 'id = ?', whereArgs: [nuevoCliente.id]);
    return res;
  }

  //Eliminar clienete por ID
  Future<int> deleteCliente(int id) async {
    final db = await database;
    final res = await db.delete('Clientes', where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
