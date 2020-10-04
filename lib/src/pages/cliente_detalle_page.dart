import 'package:crud_v1/src/pages/form_registro.dart';
import 'package:crud_v1/src/providers/db_cliente.dart';
import 'package:flutter/material.dart';

class ClienteDetallePage extends StatelessWidget {
  final int id;
  final String nombre;
  final String telefono;
  final String email;
  final int edad;

  const ClienteDetallePage({
    this.id,
    @required this.nombre,
    @required this.telefono,
    @required this.email,
    @required this.edad,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {
              _mostrarAlertaBorrarContacto(context);
            },
          )
        ],
      ),
      body: _construirBody(context),
      floatingActionButton: _CrearBoton(id, nombre, telefono, email, edad),
    );
  }

  void _mostrarAlertaBorrarContacto(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Borrar cliente'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('¿Desea borrar este cliente?'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Borrar', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                DBProvider.db.deleteCliente(this.id);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Widget _construirBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Column(
              children: [
                _CrearCircleAvatar(this.nombre),
                Divider(),
                _CrearAcciones(),
                Divider(),
                _CrearOpcionesRapidas(this.telefono),
                Divider(),
                _CrearCorreo(this.email),
                Divider(),
                _CrearEdad(this.edad),
                Divider(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _CrearEdad extends StatelessWidget {
  final int edad;

  _CrearEdad(this.edad);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Icon(Icons.accessibility_new),
        SizedBox(width: 20),
        Text('${this.edad.toString()}' + ' años'),
      ],
    );
  }
}

class _CrearCorreo extends StatelessWidget {
  final String email;

  _CrearCorreo(this.email);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Icon(Icons.alternate_email),
        SizedBox(width: 20),
        Text('${this.email}'),
        Spacer(),
        Icon(Icons.email, color: Colors.blue),
        SizedBox(width: 15),
      ],
    );
  }
}

class _CrearBoton extends StatelessWidget {
  final int id;
  final String nombre;
  final String telefono;
  final String email;
  final int edad;

  const _CrearBoton(
    this.id,
    this.nombre,
    this.telefono,
    this.email,
    this.edad,
  );
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormRegistro(
              id: this.id,
              accion: 'Editar',
              nombre: this.nombre,
              telefono: this.telefono,
              email: this.email,
              edad: this.edad,
            ),
          ),
        );
      },
    );
  }
}

class _CrearOpcionesRapidas extends StatelessWidget {
  final String telefono;

  _CrearOpcionesRapidas(this.telefono);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(Icons.call),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${this.telefono}'),
            Text(
              'Móvil',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.video_call,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.message,
          color: Colors.blue,
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}

class _CrearAcciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'Llamar'),
        _accion(Icons.message, 'Mensaje de texto'),
        _accion(Icons.video_call, 'Vídeo'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          texto,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

class _CrearCircleAvatar extends StatelessWidget {
  final String nombre;

  _CrearCircleAvatar(this.nombre);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Center(
          child: CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.pink[200],
            child: Text(
              '${this.nombre.substring(0, 1)}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            '${this.nombre}',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
