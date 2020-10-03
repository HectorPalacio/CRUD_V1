import 'package:crud_v1/src/pages/form_registro.dart';
import 'package:flutter/material.dart';

import 'cliente_detalle_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de clientes'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 50,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink[200],
              child: Text('HP',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            title: Text('Hola mundo'),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormRegistro(),
            ),
          );
        },
      ),
    );
  }
}
