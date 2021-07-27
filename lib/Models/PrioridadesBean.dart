import 'dart:convert';

List<Prioridades> prioridadesFromJson(String str) => List<Prioridades>.from(
    json.decode(str).map((x) => Prioridades.fromJson(x)));

String prioridadesToJson(List<Prioridades> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prioridades {
  Prioridades({
    this.idPrioridad,
    this.tipo,
    this.cancelado,
  });

  int? idPrioridad;
  String? tipo;
  int? cancelado;

  factory Prioridades.fromJson(Map<String, dynamic> json) => Prioridades(
        idPrioridad: json["idPrioridad"],
        tipo: json["tipo"],
        cancelado: json["cancelado"],
      );

  Map<String, dynamic> toJson() => {
        "idPrioridad": idPrioridad,
        "tipo": tipo,
        "cancelado": cancelado,
      };
}
