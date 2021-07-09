import 'dart:convert';

List<Modalidades> modalidadesFromJson(String str) => List<Modalidades>.from(json.decode(str).map((x) => Modalidades.fromJson(x)));

String modalidadesToJson(List<Modalidades> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modalidades {
  Modalidades({
    this.id,
    this.nombreModalidad,
    this.tipoServicioId,
    this.prioridadId,
    this.tiempoRespuesta,
    this.cancelado,
  });

  int id;
  String nombreModalidad;
  int tipoServicioId;
  int prioridadId;
  String tiempoRespuesta;
  int cancelado;

  factory Modalidades.fromJson(Map<String, dynamic> json) => Modalidades(
    id: json["id"],
    nombreModalidad: json["nombreModalidad"],
    tipoServicioId: json["tipoServicio_id"],
    prioridadId: json["prioridad_id"],
    tiempoRespuesta: json["tiempoRespuesta"],
    cancelado: json["cancelado"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombreModalidad": nombreModalidad,
    "tipoServicio_id": tipoServicioId,
    "prioridad_id": prioridadId,
    "tiempoRespuesta": tiempoRespuesta,
    "cancelado": cancelado,
  };
}
