import 'dart:convert';

List<TipoServicioBean> tipoServicioBeanFromJson(String str) => List<TipoServicioBean>.from(json.decode(str).map((x) => TipoServicioBean.fromJson(x)));

String tipoServicioBeanToJson(List<TipoServicioBean> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoServicioBean {
  TipoServicioBean({
    this.idTipoServicio,
    this.nombre,
    this.cancelado,
  });

  int idTipoServicio;
  String nombre;
  int cancelado;

  factory TipoServicioBean.fromJson(Map<String, dynamic> json) => TipoServicioBean(
    idTipoServicio: json["idTipoServicio"],
    nombre: json["nombre"],
    cancelado: json["cancelado"],
  );

  Map<String, dynamic> toJson() => {
    "idTipoServicio": idTipoServicio,
    "nombre": nombre,
    "cancelado": cancelado,
  };
}
