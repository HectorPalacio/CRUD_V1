class ClienteModel {
  int id;
  String nombre;
  String telefono;
  String email;
  int edad;

  ClienteModel({
    this.id,
    this.nombre,
    this.telefono,
    this.email,
    this.edad,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) => new ClienteModel(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        edad: json["edad"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "edad": edad,
      };
}
