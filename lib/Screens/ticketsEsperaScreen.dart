import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_soporte/Models/TipoServicioBean.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  List<TipoServicioBean> servicios = [];
  Future<List<TipoServicioBean>> getServicios() async {
    var url = Uri.parse("https://wshelpdesk.gruposeri.com:36000/tiposervicio");
    var response = await http.get(url);
    return tipoServicioBeanFromJson(response.body);
  }

  @override
  void initState() {
    super.initState();
    getServicios().then((value) {
      setState(() {
        servicios.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      color: Colors.redAccent,
      child: ListView.builder(
          itemCount: servicios.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                margin: EdgeInsets.all(9.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(servicios[index].idTipoServicio.toString()),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(servicios[index].nombre),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
