import 'package:crud_v1/src/bloc/cliente_bloc.dart';
import 'package:crud_v1/src/models/cliente_model.dart';
import 'package:crud_v1/src/pages/form_registro.dart';
import 'package:flutter/material.dart';

import 'cliente_detalle_page.dart';

class HomePage extends StatelessWidget {
  final clienteBloc = new ClienteBloc();
  @override
  Widget build(BuildContext context) {
    clienteBloc.obtenerClientes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de clientes'),
      ),
      body: StreamBuilder<List<ClienteModel>>(
        stream: clienteBloc.clientesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final clientes = snapshot.data;
          if (clientes.length == 0) {
            return Center(
              child: Text('No hay clientes guardados'),
            );
          }
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink[200],
                  child: Text(
                    clientes[index].nombre.substring(0, 1),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(clientes[index].nombre),
                subtitle: Text(clientes[index].id.toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClienteDetallePage(
                        id: clientes[index].id,
                        nombre: clientes[index].nombre,
                        telefono: clientes[index].telefono,
                        email: clientes[index].email,
                        edad: clientes[index].edad,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormRegistro(
                accion: 'Crear',
              ),
            ),
          );
        },
      ),
    );
  }
}
