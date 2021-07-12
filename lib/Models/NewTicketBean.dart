import 'dart:convert';

NewTicket newTicketFromJson(String str) => NewTicket.fromJson(json.decode(str));

String newTicketToJson(NewTicket data) => json.encode(data.toJson());

class NewTicket {
  NewTicket({
    this.userSolicitanteId,
    this.empresaId,
    this.modalidadId,
    this.descripcionProblema,
  });

  String userSolicitanteId;
  String empresaId;
  String modalidadId;
  String descripcionProblema;

  factory NewTicket.fromJson(Map<String, dynamic> json) => NewTicket(
        userSolicitanteId: json["user_solicitante_id"],
        empresaId: json["empresa_id"],
        modalidadId: json["modalidad_id"],
        descripcionProblema: json["descripcion_problema"],
      );

  Map<String, dynamic> toJson() => {
        "user_solicitante_id": userSolicitanteId,
        "empresa_id": empresaId,
        "modalidad_id": modalidadId,
        "descripcion_problema": descripcionProblema,
      };
}
