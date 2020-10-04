import 'dart:async';

import 'package:crud_v1/src/models/cliente_model.dart';
import 'package:crud_v1/src/providers/db_cliente.dart';

class ClienteBloc {
  static final ClienteBloc _singleton = new ClienteBloc._internal();

  factory ClienteBloc() {
    return _singleton;
  }
  ClienteBloc._internal() {
    obtenerClientes();
  }

  final _clientesController = StreamController<List<ClienteModel>>.broadcast();

  Stream<List<ClienteModel>> get clientesStream => _clientesController.stream;

  dispose() {
    _clientesController?.close();
  }

  obtenerClientes() async {
    _clientesController.sink.add(await DBProvider.db.getTodosClientes());
  }

  agregarCliente(ClienteModel nuevoCliente) async {
    await DBProvider.db.nuevoCliente(nuevoCliente);
    obtenerClientes();
  }

  borrarCliente(int id) async {
    await DBProvider.db.deleteCliente(id);
    obtenerClientes();
  }
}
