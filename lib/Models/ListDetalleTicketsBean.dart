import 'dart:convert';

List<ListDetalleTicketsBean> listDetalleTicketsBeanFromJson(String str) =>
    List<ListDetalleTicketsBean>.from(
        json.decode(str).map((x) => ListDetalleTicketsBean.fromJson(x)));

String listDetalleTicketsBeanToJson(List<ListDetalleTicketsBean> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDetalleTicketsBean {
  ListDetalleTicketsBean({
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

  factory ListDetalleTicketsBean.fromJson(Map<String, dynamic> json) =>
      ListDetalleTicketsBean(
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
        fechaProcesamiento: json["fechaProcesamiento"],
        fechaTermino: json["fechaTermino"],
      );

  Map<String, dynamic> toJson() => {
        "idTicket": idTicket,
        "empresaId": empresaId,
        "nombreEmpresa": nombreEmpresa,
        "descripcionProblema": descripcionProblema,
        "modalidadId": modalidadId,
        "nombreModalidad": nombreModalidad,
        "statusId": statusId,
        "status": status,
        "prioridadId": prioridadId,
        "prioridad": prioridad,
        "usuarioSolicitante": usuarioSolicitante,
        "usuarioSolicitanteId": usuarioSolicitanteId,
        "usuarioAsignado": usuarioAsignado,
        "usuarioAsignadoId": usuarioAsignadoId,
        "fechaCreacion": fechaCreacion,
        "fechaAsignacion": fechaAsignacion,
        "fechaProcesamiento": fechaProcesamiento,
        "fechaTermino": fechaTermino,
      };
}
