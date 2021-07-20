import 'package:app_soporte/Data/accesosWS.dart';
import 'package:app_soporte/Models/TicketsBean.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/appStrings.dart';
import 'package:app_soporte/Widgets/errorPage.dart';
import 'package:app_soporte/Widgets/loadPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetallesTicketCola extends StatefulWidget {
  @override
  _DetallesTicketColaState createState() => _DetallesTicketColaState();
}

class _DetallesTicketColaState extends State<DetallesTicketCola> {
  List<Tickets> ticket;

  Text textos(String txt, double size) {
    Widget texto = Text(txt,
        style: GoogleFonts.inconsolata(
            color: bg_white, fontSize: size, fontWeight: FontWeight.bold));
    return texto;
  }

  // CAMBIA EL COLOR DEL DROP SEGUN LA PRIORIDAD
  Color cambiaColorDropPrioridad(String newValue) {
    print(newValue);
    Color color;
    if (int.parse(newValue) == 1) {
      color = bg_fondo_important_ticket;
    } else if (int.parse(newValue) == 2) {
      color = bg_fondo_medium_ticket;
    } else if (int.parse(newValue) == 3) {
      color = bg_fondo_less_ticket;
    }

    return color;
  }

  String _setTimeAgo(DateTime fecha) {
    String time;
    time = timeago.format(fecha, locale: 'es');

    return time.toUpperCase();
  }

  Widget appbar(BuildContext context, String prioridad) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: cambiaColorDropPrioridad(prioridad),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          //color: bg_fondo_important_ticket, //bg_dfondo,
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: IconButton(
                    icon: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.chevron_back,
                          color: bg_white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          ' Regresar',
                          style: TextStyle(color: bg_white, fontSize: 18),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      'Detalle ticket',
                      style: TextStyle(color: bg_white, fontSize: 25),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text descripcionestxt(String txt, double size) {
    Widget texto = Text(txt,
        style: GoogleFonts.inconsolata(
          color: bg_dark.withOpacity(0.8),
          fontSize: size,
          fontWeight: FontWeight.bold,
        ));
    return texto;
  }

  Future<void> _cancelConfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cancelar Ticket?'),
          content: Card(
            color: Colors.transparent,
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    //focusColor: Colors.transparent,
                    //hoverColor: Colors.transparent,
                    labelText: "Comentarios",
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '*Los comentarios son obligatorios para la cancelación del ticket.',
                  style: TextStyle(color: Colors.black26),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getTicket(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            Widget screen;

            if (snapshot.connectionState == ConnectionState.waiting) {
              screen = LoadPage();
            }
            if (snapshot.connectionState == ConnectionState.none) {
              screen = ErrorPage();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              screen = SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appbar(context, prioridadId),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Text(
                        'Fecha Creación',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ListTile(
                        leading: Icon(
                          CupertinoIcons.calendar,
                          color: bg_dfondo,
                        ),
                        title: Text(
                          _setTimeAgo(DateTime.parse(fechaCreacion)),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'Modalidad',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ListTile(
                        //leading: Icon(CupertinoIcons.asterisk_circle),
                        title: Text(
                          nombreModalidad,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'Descripción Problema',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ListTile(
                        //leading: Icon(CupertinoIcons.chat_bubble_text),
                        title: Text(
                          descripcionProblema,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'Usuario Solicitante',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ListTile(
                        leading: Icon(
                          CupertinoIcons.person_crop_circle,
                          color: bg_dfondo,
                        ),
                        title: Text(
                          usuarioSolicitante,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        'Prioridad',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: ListTile(
                        leading: Icon(
                          CupertinoIcons.exclamationmark_triangle_fill,
                          color: bg_dfondo,
                        ),
                        title: Text(
                          prioridad,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(bg_dfondo),
                          ),
                          onPressed: () {
                            _cancelConfirm();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                              child: Text('Cancelar'),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(bg_dfondo),
                          ),
                          onPressed: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                              child: Text('Editar'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return screen;
          }),
    );
  }
}
