import 'package:app_soporte/Models/EmpresasBean.dart';
import 'package:app_soporte/Models/ModalidadesBean.dart';
import 'package:app_soporte/Models/PrioridadesBean.dart';
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

//////////////////////////////////////////
//////////////////////////////////////////