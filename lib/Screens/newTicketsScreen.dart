import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_soporte/Models/RespuestasBean.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Data/accesosWS.dart';
import 'package:app_soporte/Models/EmpresasBean.dart';
import 'package:app_soporte/Models/ModalidadesBean.dart';
import 'package:app_soporte/Models/PrioridadesBean.dart';
import 'package:app_soporte/Models/TipoServicioBean.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appStrings.dart';

class NewTicketsScreen extends StatefulWidget {
  @override
  _NewTicketsScreenState createState() => _NewTicketsScreenState();
}

class _NewTicketsScreenState extends State<NewTicketsScreen> {
  List<TipoServicioBean> servicios;
  List<Modalidades> modalidades;
  List<Empresas> empresas;
  List<Prioridades> prioridades;
  Color bgDropPrioridades;
  bool isEmpty;
  Respuestas response;
  SharedPreferences prefs;
  //form variables
  TextEditingController cometarioscontroller;

  //form variables
  @override
  void initState() {
    isEmpty = true;
    cometarioscontroller = TextEditingController();
    bgDropPrioridades = bg_white;
    // INICIALIZA DROPD DE SERVICIOS
    getServicios().then((value) {
      setState(() {
        servicios = value;
      });
    });
    // INICIALIZA DROPD DE EMPRESAS
    getEmpresas().then((value) {
      setState(() {
        empresas = value;
      });
    });
    // INICIALIZA DROPD DE PRIORIDADES
    getPrioridades().then((value) {
      setState(() {
        prioridades = value;
      });
    });
    getprefs();
    super.initState();
  }

  // LLENA EN DROPD DEPENDIENDO DE LA SELECCION DEL SERVICIO
  void cargaModalidades() {
    getModalidades(valorDropServicio).then((value) async {
      setState(() {
        modalidades = value;
        isEmpty = false;
      });
    });
  }

  void getprefs() async {
    prefs = await getSharePreferences();
    userid = prefs.getString('idUsuario');
  }

  SnackBar customsnackbar(String text) {
    return SnackBar(
      backgroundColor: bg_dark.withOpacity(0.8),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: bg_white),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  // CAMBIA EL COLOR DEL DROP SEGUN LA PRIORIDAD
  void cambiaColorDropPrioridad(newValue) {
    print(newValue);
    Color color;
    if (int.parse(valorDropPrioridad) == 1) {
      color = bg_fondo_important_ticket;
    } else if (int.parse(valorDropPrioridad) == 2) {
      color = bg_titulo_medium_ticket;
    } else if (int.parse(valorDropPrioridad) == 3) {
      color = bg_fondo_less_ticket;
    }

    setState(() {
      bgDropPrioridades = color;
    });
  }

  // CARGA VALIDACION DEL FORM PARA GUARDAR TICKET
  void validaNewTicket() async {
    if (valorDropServicio == null ||
            valorDropModalidad == null ||
            valorDropEmpresa ==
                null /* ||
        valorDropPrioridad == null */
        ) {
      ScaffoldMessenger.of(context).showSnackBar(
        customsnackbar('Llena correctamente el formulario'),
      );
    } else {
      response = await postSaveNewTicket(userid, valorDropEmpresa,
          valorDropModalidad, cometarioscontroller.text);
      if (response == null) {
        customsnackbar('Error ');
      } else {
        if (int.parse(response.iFlag) == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            //customsnackbar('Llena correctamente el formulario'),
            customsnackbar(response.sMessage.toString()),
          );
          Navigator.pushReplacementNamed(context, 'home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            //customsnackbar('Se agrego correctamente el ticket'),
            customsnackbar(response.sMessage.toString()),
          );
        }
        //customsnackbar(' termino y Nada');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .85,
            decoration: BoxDecoration(
              color: bg_fondo_form,
            ),
            padding: EdgeInsets.only(
                top: 10.0, bottom: 30.0, left: 30.0, right: 30.0),
            //padding: EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                //SizedBox(height: 20.0,),
                Text(
                  "Tipos de Servicios",
                  style: TextStyle(
                    color: bg_dark,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.0),
                //DROP DE TIPOS SERVICIO
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: bg_light,
                    border: Border.all(color: bg_dark),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text(
                      "Selecciona el Servicio ",
                      style: TextStyle(color: bg_dark),
                    ),
                    dropdownColor: bg_white.withOpacity(0.9),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 26,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: bg_dark, fontSize: 18),
                    value: valorDropServicio,
                    items: servicios?.map((servicio) {
                          return DropdownMenuItem(
                            value: servicio.idTipoServicio.toString(),
                            child: Text(
                              servicio.nombre.toString(),
                              style: TextStyle(color: bg_dark),
                            ),
                          );
                        })?.toList() ??
                        [],
                    onChanged: (newValue) {
                      setState(() {
                        valorDropServicio = newValue;
                        valorDropModalidad = null;
                        cargaModalidades();
                      });
                    },
                  ),
                ),
                // DROPDOWN DE Tipos de Servicio
                SizedBox(height: 20.0),
                // DROPDOWN DE Modalidades
                Text(
                  "Modalidades",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    if (isEmpty == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customsnackbar('Selecciona primero un servicio!'),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      color: bg_light,
                      border:
                          Border.all(color: Colors.blueGrey[400], width: 0.5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey[200].withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 0.5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: DropdownButton(
                      hint: Text(
                        "Selecciona la Modalidad",
                        style: TextStyle(color: bg_dark),
                      ),
                      dropdownColor: bg_white.withOpacity(0.9),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 26,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(color: bg_dark, fontSize: 18),
                      value: valorDropModalidad,
                      items: modalidades?.map((modalidad) {
                            return DropdownMenuItem(
                              value: modalidad.id.toString(),
                              child: Text(
                                modalidad.nombreModalidad,
                                style: TextStyle(color: bg_dark),
                              ),
                            );
                          })?.toList() ??
                          [],
                      onChanged: (newValue) {
                        setState(() {
                          valorDropModalidad = newValue;
                        });
                      },
                    ),
                  ),
                ),
                // DROPDOWN DE Modalidades

                SizedBox(height: 20.0),

                // DROPDOWN DE EMPRESAS
                Text(
                  "Empresa",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: bg_white,
                    border: Border.all(color: bg_dark, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text(
                      "Selecciona la empresa",
                      style: TextStyle(color: bg_dark),
                    ),
                    dropdownColor: bg_white.withOpacity(0.9),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 26,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: bg_dark, fontSize: 18),
                    value: valorDropEmpresa,
                    items: empresas?.map((empresa) {
                          return DropdownMenuItem(
                            value: empresa.id.toString(),
                            child: Text(
                              empresa.nombreEmpresa,
                              style: TextStyle(color: bg_dark),
                            ),
                          );
                        })?.toList() ??
                        [],
                    onChanged: (newValue) {
                      setState(() {
                        valorDropEmpresa = newValue;
                      });
                    },
                  ),
                ),
                // DROPDOWN DE EMPRESAS
                SizedBox(height: 20.0),
                // DROPDOWN DE PRIORIDAD
                /* Text(
                  "Prioridad",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    color: bgDropPrioridades,
                    border: Border.all(color: bg_dark, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    hint: Text(
                      "Selecciona la prioridad",
                      style: TextStyle(color: bg_dark),
                    ),
                    dropdownColor: bg_white.withOpacity(0.9),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 26,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    value: valorDropPrioridad,
                    items: prioridades?.map((prioridad) {
                          return DropdownMenuItem(
                            value: prioridad.idPrioridad.toString(),
                            child: Text(
                              prioridad.tipo,
                              style: TextStyle(color: bg_dark),
                            ),
                          );
                        })?.toList() ??
                        [],
                    onChanged: (newValue) {
                      setState(() {
                        valorDropPrioridad = newValue;
                        cambiaColorDropPrioridad(newValue);
                      });
                    },
                  ),
                ),
                // DROPDOWN DE PRIORIDAD

                SizedBox(height: 20.0),
 */
                TextField(
                  controller: cometarioscontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Comentarios",
                    labelStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                    hintText: 'Ingresa tus comentarios acerca del problema.',
                  ),
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),

                Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: () {
                    validaNewTicket();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save, color: bg_white),
                      Text(
                        ' Generar ticket',
                        style: TextStyle(
                          color: bg_white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: bg_rojo,
                    onPrimary: bg_dark,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 8,
                  ),
                ),
                /* InkWell(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    decoration: BoxDecoration(
                        color: bg_addbutton,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.save, color: bg_white),
                        Text(
                          ' Generar ticket',
                          style: TextStyle(
                            color: bg_white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), */
              ],
            ),
          ),
        );
      }),
    );
  }
}
