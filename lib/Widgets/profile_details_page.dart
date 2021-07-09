import 'package:app_soporte/Screens/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TicketsEnCola.dart';
import 'TicketsEnProceso.dart';

class Profile5 extends StatefulWidget {
  @override
  _Profile5State createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(color: bg_dfondo),
            child: TabBar(
              tabs: [
                Tab(
                  text: 'En Curso',
                  icon: Icon(Icons.info),
                ),
                Tab(
                  text: 'En Proceso',
                  icon: Icon(Icons.info),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                EnCola(),
                //////////
                EnProceso(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
