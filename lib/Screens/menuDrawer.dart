import 'package:app_soporte/Screens/TicketsScreen.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/menu.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg_primary,
      ),
      drawer: Menu(),
      body: TicketScreen(),
    );
  }
}
