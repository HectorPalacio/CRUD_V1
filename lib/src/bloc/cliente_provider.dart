import 'package:flutter/material.dart';

class ClienteProvider with ChangeNotifier {
  int _id = 0;
  String _nombre = '';
  String _telefono = '';
  String _email = '';
  int _edad = 0;

  int get id => this._id;
  set id(int id) {
    this._id = id;
    notifyListeners();
  }

  String get nombre => this._nombre;
  set nombre(String nombre) {
    this._nombre = nombre;
    notifyListeners();
  }

  String get telefono => this._telefono;
  set telefono(String telefono) {
    this._telefono = telefono;
    notifyListeners();
  }

  String get email => this._email;
  set email(String email) {
    this._email = email;
    notifyListeners();
  }

  int get edad => this._edad;
  set edad(int edad) {
    this._edad = edad;
    notifyListeners();
  }
}
