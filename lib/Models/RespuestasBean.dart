import 'dart:convert';

Respuestas respuestasFromJson(String str) =>
    Respuestas.fromJson(json.decode(str));

String respuestasToJson(Respuestas data) => json.encode(data.toJson());

class Respuestas {
  Respuestas({
    this.iFlag,
    this.sMessage,
  });

  String? iFlag;
  String? sMessage;

  factory Respuestas.fromJson(Map<String, dynamic> json) => Respuestas(
        iFlag: json["iFlag"],
        sMessage: json["sMessage"],
      );

  Map<String, dynamic> toJson() => {
        "iFlag": iFlag,
        "sMessage": sMessage,
      };
}
