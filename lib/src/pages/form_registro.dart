import 'package:flutter/material.dart';

class FormRegistro extends StatefulWidget {
  @override
  _FormRegistroState createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  String id;
  String nombre;
  String telefono;
  String email;
  int edad;
  final accion;

  _FormRegistroState({@required this.accion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        title: Text('Editar/Guardar contacto'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 20),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Guardar',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: _contruirBody(),
    );
  }

  Widget _contruirBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _CrearCircleAvatar(),
          SizedBox(height: 30),
          _crearInputNombre(),
          Divider(),
          _crearInputTelefono(),
          Divider(),
          _crearInputEmail(),
          Divider(),
          _crearInputEdad(),
        ],
      ),
    );
  }

  Widget _crearInputNombre() {
    return TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          icon: Icon(Icons.person),
        ),
        onChanged: (value) {
          setState(() {});
        });
  }

  Widget _crearInputTelefono() {
    return TextField(
        //autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Teléfono',
          labelText: 'Teléfono',
          icon: Icon(Icons.call),
        ),
        onChanged: (value) {
          setState(() {});
        });
  }

  Widget _crearInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  Widget _crearInputEdad() {
    return TextField(
        //autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Edad',
          labelText: 'Edad',
          icon: Icon(Icons.border_color),
        ),
        onChanged: (value) {
          setState(() {});
        });
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
