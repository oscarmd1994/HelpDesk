import 'dart:ui';
import 'package:app_soporte/Data/accesosWS.dart';
import 'package:app_soporte/Screens/appStrings.dart';
import 'package:app_soporte/Widgets/errorPage.dart';
import 'package:app_soporte/Widgets/loadPage.dart';
import 'package:flutter/material.dart';
import 'TicketsScreen.dart';
import 'newTicketsScreen.dart';
import 'profileScreen.dart';
import 'HistorialScreen.dart';
import 'appColors.dart';

class MenuNavigationBarScreen extends StatefulWidget {
  @override
  _MenuNavigationBarScreenState createState() =>
      _MenuNavigationBarScreenState();
}

class _MenuNavigationBarScreenState extends State<MenuNavigationBarScreen> {
  int _currentIndex = 0;
  Widget selectedScreen = TicketScreen();
  String titulo = "Inicio";

  @override
  void initState() {
    //saveDataEmp();
    super.initState();
  }

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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Cerrar Help Desk'),
            content: Text('¿Estas seguro?'),
            actions: <Widget>[
              TextButton(
                child: Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text("Continuar"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: FutureBuilder(
        future: saveDataEmp(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget screen = Container();
          if (snapshot.connectionState == ConnectionState.waiting) {
            screen = LoadPage();
          } else if (snapshot.connectionState == ConnectionState.none) {
            errorText = "REVIZA TU CONEXÓN A INTERNET";
            screen = ErrorPage();
          } else if (snapshot.connectionState == ConnectionState.done) {
            screen = Scaffold(
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

          return screen;
        },
      ),
    );
  }
}

Widget getScreen(index) {
  Widget w = Container();
  if (index == 0) {
    w = TicketScreen();
  }
  if (index == 1) {
    w = ProfileScreen();
  }
  if (index == 2) {
    w = HistorialScreen();
  }
  if (index == 3) {
    w = NewTicketsScreen();
  }
  return w;
}
