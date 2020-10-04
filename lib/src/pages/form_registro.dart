import 'package:crud_v1/src/bloc/cliente_provider.dart';
import 'package:crud_v1/src/providers/db_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormRegistro extends StatelessWidget {
  final String accion;
  final String nombre;
  final String telefono;
  final String email;
  final int edad;
  final controllerNombreText = TextEditingController();
  final controllerTelefonoText = TextEditingController();
  final controllerEmailText = TextEditingController();
  final controllerEdadText = TextEditingController();

  FormRegistro({
    @required this.accion,
    this.nombre,
    this.telefono,
    this.email,
    this.edad,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClienteProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
              title: Text('$accion contacto'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 20),
                  child: GestureDetector(
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      // SET
                      Provider.of<ClienteProvider>(context, listen: false)
                          .nombre = controllerNombreText.text;
                      Provider.of<ClienteProvider>(context, listen: false)
                          .telefono = controllerTelefonoText.text;
                      Provider.of<ClienteProvider>(context, listen: false)
                          .email = controllerEmailText.text;
                      Provider.of<ClienteProvider>(context, listen: false)
                          .edad = int.parse(controllerEdadText.text);
                      // GET
                      final nuevoCliente = ClienteModel(
                          nombre: Provider.of<ClienteProvider>(context,
                                  listen: false)
                              .nombre,
                          telefono: Provider.of<ClienteProvider>(context,
                                  listen: false)
                              .telefono,
                          email: Provider.of<ClienteProvider>(context,
                                  listen: false)
                              .email,
                          edad: Provider.of<ClienteProvider>(context,
                                  listen: false)
                              .edad);
                      final resp = DBProvider.db.nuevoCliente(nuevoCliente);
                      print(resp);
                      if (resp == 0) {
                        print('ok');
                      } else {
                        print('okn\'t');
                      }
                    },
                  ),
                ),
              ],
            ),
            body: _contruirBody(context),
          );
        },
      ),
    );
  }

  Widget _contruirBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _CrearCircleAvatar(),
          SizedBox(height: 30),
          _crearInputNombre(context),
          Divider(),
          _crearInputTelefono(context),
          Divider(),
          _crearInputEmail(context),
          Divider(),
          _crearInputEdad(context),
        ],
      ),
    );
  }

  Widget _crearInputNombre(BuildContext context) {
    if (this.nombre != null) {
      controllerNombreText.text = this.nombre;
    }
    return TextField(
      controller: controllerNombreText,
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombre',
        labelText: 'Nombre',
        icon: Icon(Icons.person),
      ),
    );
  }

  Widget _crearInputTelefono(BuildContext context) {
    if (this.telefono != null) {
      controllerTelefonoText.text = this.telefono;
    }
    return TextField(
      controller: controllerTelefonoText,
      //autofocus: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Teléfono',
        labelText: 'Teléfono',
        icon: Icon(Icons.call),
      ),
    );
  }

  Widget _crearInputEmail(BuildContext context) {
    if (this.email != null) {
      controllerEmailText.text = this.email;
    }
    return TextField(
      controller: controllerEmailText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget _crearInputEdad(BuildContext context) {
    if (this.edad != null) {
      controllerEdadText.text = this.edad.toString();
    }
    return TextField(
      controller: controllerEdadText,
      //autofocus: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Edad',
        labelText: 'Edad',
        icon: Icon(Icons.border_color),
      ),
    );
  }
}

class _CrearCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.pink[200],
            child: Icon(Icons.add_a_photo),
          ),
        ),
      ],
    );
  }
}
