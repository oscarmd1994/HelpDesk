import 'package:app_soporte/Data/accesosWS.dart';
import 'package:flutter/material.dart';
import 'package:app_soporte/Models/RespuestasBean.dart';
import 'package:app_soporte/Screens/appColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginValidationSplashScreen.dart';
import 'package:http/http.dart' as http;

class LoginScreenAdmin extends StatefulWidget {
  @override
  _LoginScreenAdminState createState() => _LoginScreenAdminState();
}

class _LoginScreenAdminState extends State<LoginScreenAdmin> {
  TextEditingController userController;
  TextEditingController passController;

  String user;
  String pass;
  String notification = "";
  Respuestas response;

  @override
  void initState() {
    userController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  Future<Respuestas> getLoginValidation(String user, String pass) async {
    final String apiUrl = "https://wshelpdesk.gruposeri.com:36000/TUsuarios/" +
        user +
        "/" +
        pass +
        "";
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return respuestasFromJson(response.body);
    } else {
      return null;
    }
  }

  SnackBar notifiValidacion(String text) {
    final snackBar = SnackBar(
      backgroundColor: bg_dark.withOpacity(0.8),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: bg_white),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
    return snackBar;
  }

  Future<void> saveShareData(user, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
    await prefs.setString('pass', pass);
    await getUserData(user, pass);
  }

  Future<void> searchSaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /* String vvuser = prefs.getString('user');
    String vvpass = prefs.getString('pass'); */
    if (prefs.getString('user') != null && prefs.getString('pass') != null) {
      Navigator.pushReplacementNamed(context, 'wait');
    }
  }

  @override
  Widget build(BuildContext context) {
    searchSaveData();
    return Scaffold(
      backgroundColor: bg_white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 0, bottom: 5.0, left: 5.0, right: 5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Image(
                  image: AssetImage("images/logo_app.png"),
                  width: 350.0,
                  height: 180.0,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "INGRESA TUS CREDENCIALES",
                  style: TextStyle(fontSize: 22.0, fontFamily: "Brand Bold"),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    bottom: 40.0,
                    left: 50.0,
                    right: 50.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      TextFormField(
                        controller: userController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                            ),
                            labelText: "Correo",
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: bg_dark),
                            hintStyle: TextStyle(
                              color: bg_light,
                              fontSize: 20.0,
                            ),
                            hintText: 'Ingresa usuario'),
                        style: TextStyle(fontSize: 20.0, color: bg_dark),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                          labelText: "Contraseña",
                          labelStyle: TextStyle(fontSize: 20.0, color: bg_dark),
                          hintStyle: TextStyle(
                            color: bg_light,
                            fontSize: 20.0,
                          ),
                          hintText: 'Ingresa contraseña',
                        ),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(bg_primary),
                        ),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          user = userController.text.trim();
                          pass = passController.text.trim();
                          response = await getLoginValidation(user, pass);
                          if (response.iFlag == "0" ||
                              int.parse(response.iFlag) == 0) {
                            saveShareData(user, pass);
                            notification = "Bienvenido";
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginValidationSplashScreen()),
                            );
                          } else if (response.iFlag == "1" ||
                              int.parse(response.iFlag) == 1) {
                            notification = "Credenciales invalidas";
                          } else if (response == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              notifiValidacion("Reviza tu conexión a Internet"),
                            );
                          }
                          if (notification == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              notifiValidacion("Error"),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              notifiValidacion(notification),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
