import 'package:app_soporte/Models/ListDetalleTicketsBean.dart';
import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class EnProceso extends StatefulWidget {
  @override
  _EnProcesoState createState() => _EnProcesoState();
}

class _EnProcesoState extends State<EnProceso> {
  List<ListDetalleTicketsBean> data = [];

  Future<List<ListDetalleTicketsBean>> getTickets() async {
    var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/list/3");
    var response = await http.get(url);
    print(response.body);
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

  Color colorFondo(prioridadId) {
    Color color = Colors.transparent;
    if (prioridadId == 1) {
      color = bg_fondo_important_ticket;
    } else if (prioridadId == 2) {
      color = bg_fondo_medium_ticket;
    } else if (prioridadId == 3) {
      color = bg_fondo_less_ticket;
    }
    return color;
  }

  Color colorTitulo(prioridadId) {
    Color color = Colors.transparent;
    if (prioridadId == 1) {
      color = bg_titulo_important_ticket;
    } else if (prioridadId == 2) {
      color = bg_titulo_medium_ticket;
    } else if (prioridadId == 3) {
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
            'No hay Tickets en proceso',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(2.0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: bg_proceso.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
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
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: bg_white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: bg_proceso_icon,
                    child: Text(
                      data[index].prioridadId.toString(),
                      style: TextStyle(
                        color: bg_white.withOpacity(0.9),
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
                    'El Beni', //data[index].usuarioAsignado,
                    style: TextStyle(
                      color: bg_dark,
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Archive',
                  color: Colors.blue,
                  icon: Icons.archive,
                  onTap: () {},
                ),
                IconSlideAction(
                  caption: 'Share',
                  color: Colors.indigo,
                  icon: Icons.share,
                  onTap: () {},
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'More',
                  color: Colors.black45,
                  icon: Icons.more_horiz,
                  onTap: () {},
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
