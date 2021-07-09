import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/HistorialScreen.dart';
import 'package:app_soporte/Screens/TicketsScreen.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/newTicketsScreen.dart';
import 'package:app_soporte/Screens/profileScreen.dart';

class MenuNavigationBarScreen extends StatefulWidget {
  const MenuNavigationBarScreen({
    Key key,
  });
  @override
  _MenuNavigationBarScreenState createState() =>
      _MenuNavigationBarScreenState();
}

class _MenuNavigationBarScreenState extends State<MenuNavigationBarScreen> {
  int _currentIndex = 0;
  Widget selectedScreen = TicketScreen();
  String titulo = "Inicio";
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      selectedScreen = getScreen(index);
      if (index == 0) {
        titulo = "Inicio";
      } else if (index == 1) {
        titulo = "Perfil";
      } else if (index == 2) {
        titulo = "Historial Tickets Concluidos";
      } else if (index == 3) {
        titulo = "Agregar Ticket";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: bg_dfondo,
        title: Text(
          titulo,
          style: TextStyle(
            fontSize: 20.0,
            color: bg_white,
          ),
        ),
        brightness: Brightness.dark,
      ),
      body: selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg_secondary,
        selectedItemColor: bg_addbutton,
        unselectedItemColor: bg_fondo_btn_menus,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.restore_sharp), label: 'Historial'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Agregar Ticket',
          ),
        ],
      ),
    );
  }
}

///////////////////////////////
///////////////////////////////

class SelectedScreen {
  static Widget screen;
}

Widget getScreen(index) {
  if (index == 0) {
    return TicketScreen();
  }
  if (index == 1) {
    return ProfileScreen();
  }
  if (index == 2) {
    return HistorialScreen();
  }
  if (index == 3) {
    return NewTicketsScreen();
  }
  //return SelectedScreen.Screen;
}
