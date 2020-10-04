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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClienteDetallePage(),
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
    // return Scaffold(
    // appBar: AppBar(
    //   title: Text('Lista de clientes'),
    // ),
    //   body: ListView.separated(
    //     physics: BouncingScrollPhysics(),
    //     itemCount: 50,
    //     separatorBuilder: (context, index) => Divider(),
    //     itemBuilder: (context, index) {
    // return ListTile(
    //   leading: CircleAvatar(
    //     backgroundColor: Colors.pink[200],
    //     child: Text('HP',
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontWeight: FontWeight.bold,
    //         )),
    //   ),
    //         title: Text('Hola mundo'),
    // onTap: () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ClienteDetallePage(),
    //     ),
    //   );
    // },
    //       );
    //     },
    //   ),
    // floatingActionButton: FloatingActionButton(
    //   backgroundColor: Colors.blue[700],
    //   child: Icon(Icons.person_add),
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => FormRegistro(
    //           accion: 'Crear',
    //         ),
    //       ),
    //     );
    //   },
    // ),
    // );
  }
}
