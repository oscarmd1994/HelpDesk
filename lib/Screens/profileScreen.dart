import 'dart:ui';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/loginAdminScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> CloseSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (await preferences.clear()) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreenAdmin()),
      );
    } else {
      print('no logout');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Oscar Mejia Doroteo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Stack(children: <Widget>[
                    Image(
                        image: AssetImage("images/oficina1.jpg"),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill),
                    Positioned(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage("images/user.png"),
                            backgroundColor: Colors.white,
                          )),
                    ),
                  ]),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "Información"),
                      //Tab(icon: Icon(Icons.edit), text: "Editar"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              first_tab(),
              //second_tab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget first_tab() {
    return Container(
      padding: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
      child: new Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.email,
                    ),
                  ),
                  Text(
                    "oscarm@raciti.com.mx",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                    ),
                  ),
                  Text(
                    "5613791062",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  Text(
                    "oscarm",
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.visibility_off,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Password",
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Editar "),
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Editando..."),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: bg_rojo,
                    ),
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Text(
                            'Cerrar sesión ',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: bg_white,
                                fontWeight: FontWeight.bold),
                          ),
                          //Expanded(child: SizedBox()),
                          Icon(
                            Icons.keyboard_return,
                            color: bg_white,
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  CloseSession();
                },
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget second_tab() {
    return Container();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.black,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
