import 'dart:convert';

List<Tickets> ticketsFromJson(String str) => List<Tickets>.from(json.decode(str).map((x) => Tickets.fromJson(x)));

String ticketsToJson(List<Tickets> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tickets {
  Tickets({
    this.idTicket,
    this.empresaId,
    this.descripcionProblema,
    this.modalidadId,
    this.nombreModalidad,
    this.statusId,
    this.status,
    this.usuarioAsignadoId,
    this.usuarioAsignado,
    this.fechaCreacion,
    this.prioridadId,
  });

  int idTicket;
  int empresaId;
  String descripcionProblema;
  int modalidadId;
  String nombreModalidad;
  int statusId;
  String status;
  int usuarioAsignadoId;
  String usuarioAsignado;
  DateTime fechaCreacion;
  int prioridadId;

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
    idTicket: json["idTicket"],
    empresaId: json["empresa_id"],
    descripcionProblema: json["descripcion_problema"],
    modalidadId: json["modalidad_id"],
    nombreModalidad: json["nombreModalidad"],
    statusId: json["status_id"],
    status: json["status"],
    usuarioAsignadoId: json["usuario_asignado_id"],
    usuarioAsignado: json["usuario_asignado"],
    fechaCreacion: DateTime.parse(json["fecha_creacion"]),
    prioridadId: json["prioridad_id"],
  );

  Map<String, dynamic> toJson() => {
    "idTicket": idTicket,
    "empresa_id": empresaId,
    "descripcion_problema": descripcionProblema,
    "modalidad_id": modalidadId,
    "nombreModalidad": nombreModalidad,
    "status_id": statusId,
    "status": status,
    "usuario_asignado_id": usuarioAsignadoId,
    "usuario_asignado": usuarioAsignado,
    "fecha_creacion": fechaCreacion.toIso8601String(),
    "prioridad_id": prioridadId,
  };
}
