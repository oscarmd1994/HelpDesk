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

  String? idTicket;
  String? empresaId;
  String? nombreEmpresa;
  String? descripcionProblema;
  String? modalidadId;
  String? nombreModalidad;
  String? statusId;
  String? status;
  String? prioridadId;
  String? prioridad;
  String? usuarioSolicitante;
  String? usuarioSolicitanteId;
  String? usuarioAsignado;
  String? usuarioAsignadoId;
  String? fechaCreacion;
  String? fechaAsignacion;
  String? fechaProcesamiento;
  String? fechaTermino;

  factory DetalleTicketsBean.fromJson(Map<String, dynamic> json) =>
      DetalleTicketsBean(
        idTicket: json["idTicket"],
        empresaId: json["empresaId"],
        nombreEmpresa: json["nombreEmpresa"],
        descripcionProblema: json["descripcionProblema"],
        modalidadId: json["modalidadId"],
        nombreModalidad: json["nombreModalidad"],
        statusId: json["statusId"],
        status: json["status"],
        prioridadId: json["prioridadId"],
        prioridad: json["prioridad"],
        usuarioSolicitante: json["usuarioSolicitante"],
        usuarioSolicitanteId: json["usuarioSolicitanteId"],
        usuarioAsignado: json["usuarioAsignado"],
        usuarioAsignadoId: json["usuarioAsignadoId"],
        fechaCreacion: json["fechaCreacion"],
        fechaAsignacion: json["fechaAsignacion"],
        fechaProcesamiento: json["fechaArocesamiento"],
        fechaTermino: json["fechaTermino"],
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
