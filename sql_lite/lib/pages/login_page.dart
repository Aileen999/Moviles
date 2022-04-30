import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sql_lite/Controller/login_controller.dart';
import 'package:sql_lite/models/enum_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
   
  @override
  void initState() {
    super.initState();
     _loginController.userController = new TextEditingController();
     _loginController.passwordController = new TextEditingController();
  }

  @override
  void dispose() {
    
    _loginController.userController = new TextEditingController();
     _loginController.passwordController = new TextEditingController();
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.04, horizontal: w * 0.04),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.04),
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: h * 0.02),
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Text(
                          "Inicio de Sesión",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Image.network(
                        "https://stagingnaxeva.online/themes/default/images/login-img.png",
                        width: w * 0.25,
                        height: h * 0.25,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Form(
                        key: _loginController.formKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              controller: _loginController.userController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Digite su usuario",
                                labelText: "Usuario",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String value) => _loginController
                                  .validator(value, InputType.user),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            TextFormField(
                              controller: _loginController.passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Digite su contraseña",
                                labelText: "Contraseña",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () => {
                                    _loginController.changeVisible(),
                                    setState(() {}),
                                  },
                                  icon: Icon(
                                    _loginController.visiblePassword
                                        ? FontAwesomeIcons.eyeSlash
                                        : FontAwesomeIcons.eye,
                                  ),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String value) => _loginController
                                  .validator(value, InputType.password),
                              obscureText: _loginController.visiblePassword,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: null,
                              child: Text(
                                "¿Olvidadó su contraseña?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.35,
                            height: h * 0.05,
                            child: ElevatedButton.icon(
                              onPressed: () => _loginController.signIn(context),
                              icon: Icon(
                                Icons.login_rounded,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Acceso",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("¿No tienes una cuenta?"),
                          InkWell(
                            onTap: null,
                            child: Text(
                              "Registrate",
                              style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
