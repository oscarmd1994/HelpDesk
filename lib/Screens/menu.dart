import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'loginAdminScreen.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool mTickes = true;
  bool mHistorial = false;
  bool mPerfil = false;
  bool m4 = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: bg_white, //bg_black,
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // Parte superior con nombre del usuario logueado y foto de perfil.
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: bg_white,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image(
                      image: AssetImage("images/user.png"),
                      width: 50, //MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "El Benito Mojica Salgado",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        "Soporte tecnico",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 14.0),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              child: Image(
                image: AssetImage("images/logo_app.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Menu",
                style: TextStyle(
                    color: bg_black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: bg_menu,
                    ),
                    child: ListTile(
                      //tileColor: bg_menu,//bg_menu,
                      leading: Icon(
                        Icons.home,
                        color: bg_black,
                      ),
                      title: Text(
                        "Tickets",
                        style: TextStyle(
                          color: bg_black,
                          fontSize: 16,
                        ),
                      ),
                      selected: mTickes,
                      onTap: () {
                        /*Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TicketScreen()),
                        );*/
                      },
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 3.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: bg_menu,
                    ),
                    child: ListTile(
                      //tileColor: bg_menu,
                      leading: Icon(
                        Icons.restore_sharp,
                        color: bg_black,
                      ),
                      title: Text(
                        "Historial",
                        style: TextStyle(
                          color: bg_black,
                          fontSize: 16,
                        ),
                      ),
                      selected: mHistorial,
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 3.0),
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: bg_menu,
                    ),
                    child: ListTile(
                      //tileColor: bg_menu,
                      leading: Icon(
                        Icons.person,
                        color: bg_black,
                      ),
                      title: Text(
                        "Perfil",
                        style: TextStyle(
                          color: bg_black,
                          fontSize: 16,
                        ),
                      ),
                      selected: mPerfil,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Salir ",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreenAdmin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
