import 'package:app_soporte/Models/ListDetalleTicketsBean.dart';
import 'package:app_soporte/Screens/appStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;

class EnCola extends StatefulWidget {
  @override
  _EnColaState createState() => _EnColaState();
}

class _EnColaState extends State<EnCola> {
  List<ListDetalleTicketsBean> data = [];

  Future<List<ListDetalleTicketsBean>> getTickets() async {
    var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/list/1");
    var response = await http.get(url);
    return listDetalleTicketsBeanFromJson(response.body);
  }

  @override
  void initState() {
    getTickets().then((value) {
      setState(() {
        data.addAll(value);
      });
    });

    super.initState();
  }

  String _setTimeAgo(fecha) {
    String time;
    //print(DateTime.parse(fecha));
    time = timeago.format(DateTime.parse(fecha), locale: 'es');
    //print(time);
    return time;
  }

  Color colorFondo(prioridadId) {
    Color color = Colors.transparent;
    if (prioridadId == "1") {
      color = bg_fondo_important_ticket;
    } else if (prioridadId == "2") {
      color = bg_fondo_medium_ticket;
    } else if (prioridadId == "3") {
      color = bg_fondo_less_ticket;
    }
    return color;
  }

  Color colorTitulo(prioridadId) {
    Color color = Colors.transparent;
    if (prioridadId == "1") {
      color = bg_titulo_important_ticket;
    } else if (prioridadId == "2") {
      color = bg_titulo_medium_ticket;
    } else if (prioridadId == "3") {
      color = bg_titulo_less_ticket;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    if (data == [] || data.isEmpty || data.length == 0) {
      return Container(
        child: Center(
          child: Text(
            'No hay Tickets concluidos',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(2.0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: colorTitulo(data[index].prioridadId),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(4, 2), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            margin: EdgeInsets.only(bottom: 2.0),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: colorFondo(data[index].prioridadId),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: bg_white.withOpacity(0.8),
                    child: Text(
                      data[index].prioridadId.toString(),
                      style: TextStyle(
                        color: bg_dark.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    foregroundColor: Colors.black,
                  ),
                  title: Text(
                    data[index].nombreModalidad!,
                    style: TextStyle(
                        color: bg_dark.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Text(
                    data[index].descripcionProblema!,
                    style: TextStyle(
                      color: bg_dark,
                    ),
                  ),
                  trailing: Text(
                    _setTimeAgo(data[index].fechaCreacion),
                    style: TextStyle(
                      color: bg_dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    String id = data[index].idTicket.toString();
                    idTicket = id;
                    Navigator.pushReplacementNamed(context, 'ticketDC');
                  },
                ),
              ),
              /* secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Detalles',
                color: Colors.black54,
                icon: CupertinoIcons.ellipsis,
                onTap: () {},
              ),
            ], */
            ),
          );
        },
      );
    }
  }
}
