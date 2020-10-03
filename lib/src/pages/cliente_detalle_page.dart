import 'package:crud_v1/src/pages/form_registro.dart';
import 'package:flutter/material.dart';

class ClienteDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _construirBody(),
    );
  }

  Widget _construirBody() {
    return Column(
      children: [
        _CrearCircleAvatar(),
        Divider(),
        _CrearAcciones(),
        Divider(),
        _CrearOpcionesRapidas(),
        Divider(),
        Spacer(),
        _CrearBoton(),
        SizedBox(height: 15)
      ],
    );
  }
}

class _CrearBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormRegistro(),
              ),
            );
          },
          child: Container(
            width: 160,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text('Editar contacto'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class _CrearOpcionesRapidas extends StatelessWidget {
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
            Text('+57 300 9997777'),
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
              'DO',
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
            'Danna Ortiz',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
