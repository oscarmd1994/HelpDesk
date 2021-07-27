import 'package:flutter/material.dart';
import 'package:app_soporte/Models/TicketsBean.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:flutter_slidable/src/widgets/slidable.dart';
import 'package:http/http.dart' as http;

import 'appColors.dart';

class HistorialScreen extends StatefulWidget {
  @override
  _HistorialScreenState createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  List<Tickets> data = [];
  Future<List<Tickets>> getTickets() async {
    var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/tickets");
    var response = await http.get(url);
    return ticketsFromJson(response.body);
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

  Color? colorFondo(prioridadId) {
    Color? color;
    if (prioridadId == 1) {
      color = bg_fondo_important_ticket;
    } else if (prioridadId == 2) {
      color = bg_titulo_medium_ticket;
    } else if (prioridadId == 3) {
      color = bg_fondo_less_ticket;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('Actualizar'),
          backgroundColor: bg_addbutton,
          onPressed: () {
            //initState();
            getTickets().then((value) {
              setState(() {
                data.clear();
                data.addAll(value);
              });
            });
          },
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(2, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          //color: bg_white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  colorFondo(data[index].prioridadId),
                              child: Text(
                                data[index].prioridadId.toString(),
                                style: TextStyle(
                                  color: bg_white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              foregroundColor: Colors.black,
                            ),
                            title: Text(
                              data[index].nombreModalidad.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: bg_black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data[index].descripcionProblema.toString(),
                              style: TextStyle(color: bg_black),
                            ),
                            trailing: Text("28/06/2021"),
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
