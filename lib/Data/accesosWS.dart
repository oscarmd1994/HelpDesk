import 'dart:convert';
import 'package:app_soporte/Models/EmpresasBean.dart';
import 'package:app_soporte/Models/ModalidadesBean.dart';
import 'package:app_soporte/Models/PrioridadesBean.dart';
import 'package:app_soporte/Models/RespuestasBean.dart';
import 'package:app_soporte/Models/TicketsBean.dart';
import 'package:app_soporte/Models/TipoServicioBean.dart';
import 'package:app_soporte/Models/UserDataBean.dart';
import 'package:app_soporte/Screens/appStrings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
Future<Respuestas> postSaveNewTicket(String usuarioSolicitanteId,
    String empresaId, String modalidadId, String descripcionProblema) async {
  final String apiUrl = "https://wshelpdesk.gruposeri.com:36000/Tickets";
  var response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      //<String, String>
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "User_solicitante_id": usuarioSolicitanteId,
      "Empresa_id": empresaId,
      "Modalidad_id": modalidadId,
      "Descripcion_problema": descripcionProblema
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return respuestasFromJson(response.body);
  } else {
    return null;
  }
}

Future<UserData> getUserData(String user, String pass) async {
  final String apiUrl = "https://wshelpdesk.gruposeri.com:36000/TUsuarios";
  var response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({"user": user, "pass": pass}),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return userDataFromJson(response.body);
  } else {
    return null;
  }
}

Future<SharedPreferences> getSharePreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await saveDataEmp();
  return prefs;
}

Future<void> saveDataEmp() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String user = prefs.getString('user');
  String pass = prefs.getString('pass');
  UserData userData = await getUserData(user, pass);

  await prefs.setString('idUsuario', userData.idUsuario);
  await prefs.setString('nombre', userData.nombre);
  await prefs.setString('paterno', userData.paterno);
  await prefs.setString('materno', userData.materno);
  await prefs.setString('email', userData.email);
  await prefs.setString('tipoUser', userData.tipoUser);
  await prefs.setString('tipoUserId', userData.tipoUserId);
}
