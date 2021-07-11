import 'package:app_soporte/Models/EmpresasBean.dart';
import 'package:app_soporte/Models/ModalidadesBean.dart';
import 'package:app_soporte/Models/PrioridadesBean.dart';
import 'package:app_soporte/Models/RespuestasBean.dart';
import 'package:app_soporte/Models/TicketsBean.dart';
import 'package:app_soporte/Models/TipoServicioBean.dart';
import 'package:http/http.dart' as http;

/////////////////////////////////////////
////////  PETICIONES GET   //////////////
/////////////////////////////////////////
Future<List<TipoServicioBean>> getServicios() async {
  var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/tiposervicio");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return tipoServicioBeanFromJson(response.body);
  } else {
    return null;
  }
}

Future<List<Tickets>> getTickets() async {
  var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/tiposervicio");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return ticketsFromJson(response.body);
  } else {
    return null;
  }
}

Future<List<Modalidades>> getModalidades(id) async {
  var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/modalidades/$id");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return modalidadesFromJson(response.body);
  } else {
    return null;
  }
}

Future<List<Empresas>> getEmpresas() async {
  var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/empresas");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return empresasFromJson(response.body);
  } else {
    return null;
  }
}

Future<List<Prioridades>> getPrioridades() async {
  var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/prioridades");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return prioridadesFromJson(response.body);
  } else {
    return null;
  }
}

/////////////////////////////////////////
////////  PETICIONES POST   /////////////
/////////////////////////////////////////
Future<Respuestas> postSaveNewTicket(int Usuario_solicitante_id, int Empresa_id,
    int Modalidad_id, String Descripcion_problema) async {
  final String apiUrl = "https://wshelpdesk.gruposeri.com:36000/TTickets";
  var response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      //<String, String>
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: {
      "user_solicitante_id": Usuario_solicitante_id,
      "empresa_id": Empresa_id,
      "modalidad_id": Modalidad_id,
      "descripcion_problema": Descripcion_problema
    },
  );
  if (response.statusCode == 200) {
    return respuestasFromJson(response.body);
  } else {
    return null;
  }
}





  // CARGA VALIDACION DEL FORM PARA GUARDAR TICKET
  // void validaNewTicket() async {
  //   if (int.parse(valorDropServicio) == 0 ||
  //       int.parse(valorDropServicio) == null ||
  //       valorDropServicio == "") {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Container(
  //             decoration: BoxDecoration(
  //                 color: bg_dark, borderRadius: BorderRadius.circular(15)),
  //             margin: EdgeInsets.only(bottom: 30.0),
  //             child: Text(
  //               'Llena correctamente el formulario',
  //               style: TextStyle(color: bg_white),
  //             )),
  //       ),
  //     );
  //   } else if (int.parse(valorDropModalidad) == 0 ||
  //       int.parse(valorDropModalidad) == null ||
  //       valorDropModalidad == "") {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Container(
  //             decoration: BoxDecoration(
  //                 color: bg_dark, borderRadius: BorderRadius.circular(15)),
  //             margin: EdgeInsets.only(bottom: 30.0),
  //             child: Text(
  //               'Llena correctamente el formulario',
  //               style: TextStyle(color: bg_white),
  //             )),
  //       ),
  //     );
  //   } else if (int.parse(valorDropEmpresa) == 0 ||
  //       int.parse(valorDropEmpresa) == null ||
  //       valorDropEmpresa == "") {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Container(
  //             decoration: BoxDecoration(
  //                 color: bg_dark, borderRadius: BorderRadius.circular(15)),
  //             margin: EdgeInsets.only(bottom: 30.0),
  //             child: Text(
  //               'Llena correctamente el formulario',
  //               style: TextStyle(color: bg_white),
  //             )),
  //       ),
  //     );
  //   } else if (int.parse(valorDropPrioridad) == 0 ||
  //       int.parse(valorDropPrioridad) == null ||
  //       valorDropPrioridad == "") {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Container(
  //             decoration: BoxDecoration(
  //                 color: bg_dark, borderRadius: BorderRadius.circular(15)),
  //             margin: EdgeInsets.only(bottom: 30.0),
  //             child: Text(
  //               'Llena correctamente el formulario',
  //               style: TextStyle(color: bg_white),
  //             )),
  //       ),
  //     );
  //   } else if (cometarioscontroller.text.trim().length > 0) {
  //     response = await postSaveNewTicket(16, int.parse(valorDropEmpresa),
  //         int.parse(valorDropModalidad), cometarioscontroller.text);

  //     if (int.parse(response.iFlag) != 0) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Container(
  //               decoration: BoxDecoration(
  //                   color: bg_dark, borderRadius: BorderRadius.circular(15)),
  //               margin: EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Llena correctamente el formulario',
  //                 style: TextStyle(color: bg_white),
  //               )),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Container(
  //               decoration: BoxDecoration(
  //                 color: bg_dark,
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               margin: EdgeInsets.only(bottom: 30.0),
  //               child: Text(
  //                 'Se agrego correctamente el ticket',
  //                 style: TextStyle(color: bg_white),
  //               )),
  //         ),
  //       );
  //     }
  //   }
  // }