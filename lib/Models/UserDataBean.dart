import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.idUsuario,
    this.nombre,
    this.paterno,
    this.materno,
    this.email,
    this.tipoUserId,
    this.tipoUser,
  });

  String idUsuario;
  String nombre;
  String paterno;
  String materno;
  String email;
  String tipoUserId;
  String tipoUser;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        idUsuario: json["idUsuario"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
        email: json["email"],
        tipoUserId: json["tipoUser_id"],
        tipoUser: json["tipoUser"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
        "email": email,
        "tipoUser_id": tipoUserId,
        "tipoUser": tipoUser,
      };
}
