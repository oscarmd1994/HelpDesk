import 'dart:ui';
import 'package:app_soporte/Data/accesosWS.dart';
import 'package:app_soporte/Widgets/errorPage.dart';
import 'package:app_soporte/Widgets/loadPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:app_soporte/Screens/appStrings.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharedPreferences? prefs;
  /* String userid;
  String name;
  String apellidos;
  String tuserid;
  String tuser;
  String email;
  String user; */

  @override
  void initState() {
    getprefs();
    super.initState();
  }

  void getprefs() async {
    prefs = await getSharePreferences();

    userid = prefs!.getString('idUsuario');
    name = prefs!.getString('nombre');
    apellidos = '${prefs!.getString('paterno')} ${prefs!.getString('materno')}';
    tuserid = prefs!.getString('tipoUserId');
    user = prefs!.getString('user');
    tuser = prefs!.getString('tipoUser');
    email = prefs!.getString('email');
  }

  Future<void> _closeSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', "");
    preferences.setString('pass', "");
    //preferences.clear();
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getSharePreferences(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            Widget screen = Container();
            if (snapshot.connectionState == ConnectionState.waiting) {
              screen = LoadPage();
            } else if (snapshot.connectionState == ConnectionState.done) {
              screen = DefaultTabController(
                length: 1,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.black,
                        expandedHeight: 200.0,
                        floating: false,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text('$name $apellidos',
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
                                    backgroundImage:
                                        AssetImage("images/user.png"),
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
                      firstTab(),
                      //secondTab(),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              screen = ErrorPage();
            }
            return screen;
          }),
    );
  }

  Widget firstTab() {
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
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.at,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Correo',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.at,
                    ),
                  ),
                  Text(
                    email!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Area'),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.at,
                    ),
                  ),
                  Text(
                    email!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Usuario'),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.at,
                    ),
                  ),
                  Text(
                    email!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.business_center,
                    ),
                  ),
                  Text(tuser!),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.account_circle,
                    ),
                  ),
                  Text(user!),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: ElevatedButton(
                  onPressed: () {
                    _closeSession();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Icon(Icons.undo, color: bg_white),
                      Text(
                        ' Cerrar Sesión',
                        style: TextStyle(
                          color: bg_white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: bg_rojo,
                    onPrimary: bg_dark,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
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

  Widget secondTab() {
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
