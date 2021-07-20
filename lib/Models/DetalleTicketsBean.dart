import 'dart:convert';

DetalleTicketsBean detalleTicketsBeanFromJson(String str) =>
    DetalleTicketsBean.fromJson(json.decode(str));

String detalleTicketsBeanToJson(DetalleTicketsBean data) =>
    json.encode(data.toJson());

class DetalleTicketsBean {
  DetalleTicketsBean({
    this.idTicket,
    this.empresaId,
    this.nombreEmpresa,
    this.descripcionProblema,
    this.modalidadId,
    this.nombreModalidad,
    this.statusId,
    this.status,
    this.prioridadId,
    this.prioridad,
    this.usuarioSolicitante,
    this.usuarioSolicitanteId,
    this.usuarioAsignado,
    this.usuarioAsignadoId,
    this.fechaCreacion,
    this.fechaAsignacion,
    this.fechaProcesamiento,
    this.fechaTermino,
  });

  String idTicket;
  String empresaId;
  String nombreEmpresa;
  String descripcionProblema;
  String modalidadId;
  String nombreModalidad;
  String statusId;
  String status;
  String prioridadId;
  String prioridad;
  String usuarioSolicitante;
  String usuarioSolicitanteId;
  String usuarioAsignado;
  String usuarioAsignadoId;
  String fechaCreacion;
  String fechaAsignacion;
  String fechaProcesamiento;
  String fechaTermino;

  factory DetalleTicketsBean.fromJson(Map<String, dynamic> json) =>
      DetalleTicketsBean(
        idTicket: json["idTicket"],
        empresaId: json["empresa_id"],
        nombreEmpresa: json["nombreEmpresa"],
        descripcionProblema: json["descripcion_problema"],
        modalidadId: json["modalidad_id"],
        nombreModalidad: json["nombreModalidad"],
        statusId: json["status_id"],
        status: json["status"],
        prioridadId: json["prioridad_id"],
        prioridad: json["prioridad"],
        usuarioSolicitante: json["usuario_solicitante"],
        usuarioSolicitanteId: json["usuario_solicitante_id"],
        usuarioAsignado: json["usuario_asignado"],
        usuarioAsignadoId: json["usuario_asignado_id"],
        fechaCreacion: json["fecha_creacion"],
        fechaAsignacion: json["fecha_asignacion"],
        fechaProcesamiento: json["fecha_procesamiento"],
        fechaTermino: json["fecha_termino"],
      );

  Map<String, dynamic> toJson() => {
        "idTicket": idTicket,
        "empresa_id": empresaId,
        "nombreEmpresa": nombreEmpresa,
        "descripcion_problema": descripcionProblema,
        "modalidad_id": modalidadId,
        "nombreModalidad": nombreModalidad,
        "status_id": statusId,
        "status": status,
        "prioridad_id": prioridadId,
        "prioridad": prioridad,
        "usuario_solicitante": usuarioSolicitante,
        "usuario_solicitante_id": usuarioSolicitanteId,
        "usuario_asignado": usuarioAsignado,
        "usuario_asignado_id": usuarioAsignadoId,
        "fecha_creacion": fechaCreacion,
        "fecha_asignacion": fechaAsignacion,
        "fecha_procesamiento": fechaProcesamiento,
        "fecha_termino": fechaTermino,
      };
}
