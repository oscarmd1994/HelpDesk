import 'dart:convert';

List<Usuarios> usuariosFromJson(String str) =>
    List<Usuarios>.from(json.decode(str).map((x) => Usuarios.fromJson(x)));

String usuariosToJson(List<Usuarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuarios {
  Usuarios({
    this.idUsuario,
    this.tipoUserId,
    this.nombre,
    this.paterno,
    this.materno,
    this.usuario,
    this.email,
    this.passw,
    this.cancelado,
  });

  int? idUsuario;
  int? tipoUserId;
  String? nombre;
  String? paterno;
  String? materno;
  String? usuario;
  String? email;
  String? passw;
  int? cancelado;

  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        idUsuario: json["idUsuario"],
        tipoUserId: json["tipoUser_id"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        usuario: json["usuario"],
        email: json["email"],
        passw: json["passw"],
        cancelado: json["cancelado"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "tipoUser_id": tipoUserId,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "usuario": usuario,
        "email": email,
        "passw": passw,
        "cancelado": cancelado,
      };
}
