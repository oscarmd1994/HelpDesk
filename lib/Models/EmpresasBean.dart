import 'dart:convert';

List<Empresas> empresasFromJson(String str) => List<Empresas>.from(json.decode(str).map((x) => Empresas.fromJson(x)));

String empresasToJson(List<Empresas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Empresas {
  Empresas({
    this.id,
    this.nombreEmpresa,
    this.cancelado,
  });

  int id;
  String nombreEmpresa;
  int cancelado;

  factory Empresas.fromJson(Map<String, dynamic> json) => Empresas(
    id: json["id"],
    nombreEmpresa: json["nombreEmpresa"],
    cancelado: json["cancelado"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombreEmpresa": nombreEmpresa,
    "cancelado": cancelado,
  };
}
