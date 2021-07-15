import 'package:app_soporte/Data/accesosWS.dart';
import 'package:app_soporte/Models/TicketsBean.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/appStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetallesTicketCola extends StatefulWidget {
  @override
  _DetallesTicketColaState createState() => _DetallesTicketColaState();
}

class _DetallesTicketColaState extends State<DetallesTicketCola> {
  List<Tickets> ticket;

  Text textos(String txt, double size) {
    Widget texto = 
      Text(
        txt,
        style: GoogleFonts.inconsolata(
        color: bg_white,
        fontSize: size,
        fontWeight: FontWeight.bold
        )
);
return texto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: bg_dfondo,
        leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            }),
        automaticallyImplyLeading: false,
        title: textos(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        color: bg_white,
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            color: bg_proceso_icon,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 3,
                blurRadius: 9,
                offset: Offset(6, 4), // changes position of shadow
              ),
            ],
          ),
          child: FutureBuilder(
            future: getTicket(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Stack(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        //Divider(thickness: 1, color: bg_white),
                        Row(
                          children: <Widget>[
                            ,
                          ],
                        ),
                        //Divider(thickness: 1, color: bg_white),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
