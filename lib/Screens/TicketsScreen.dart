import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Widgets/TicketsEnCola.dart';
import 'package:app_soporte/Widgets/TicketsEnProceso.dart';
import 'package:app_soporte/Widgets/TicketsAplazados.dart';

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
                color: bg_dfondo
            ),
            child: TabBar(

              tabs: [
                Tab(
                  text: 'En Espera',
                  icon: Icon(Icons.watch_later_outlined),
                ),
                Tab(
                  text: 'En Proceso',
                  icon: Icon(Icons.handyman_sharp),
                ),
                Tab(
                  text: 'Aplazados',
                  icon: Icon(Icons.people_alt),
                ),
                Tab(
                  text: 'Concluidos 24h',
                  icon: Icon(Icons.check_sharp),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                EnCola(),
                EnProceso(),
                Aplazados(),
                EnProceso(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

