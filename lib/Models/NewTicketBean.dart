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
        "User_solicitante_id": userSolicitanteId,
        "Empresa_id": empresaId,
        "Modalidad_id": modalidadId,
        "Descripcion_problema": descripcionProblema,
      };
}
