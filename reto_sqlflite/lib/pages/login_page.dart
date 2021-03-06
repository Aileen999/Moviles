import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reto_sqlflite/pages/register_page.dart';

import '../controller/login_controller.dart';
import '../model/enum_model.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
   
  @override
  void initState() {
    super.initState();
     _loginController.emailController =  TextEditingController();
     _loginController.passwordController =  TextEditingController();
  }

  @override
  void dispose() {
    
    _loginController.emailController = TextEditingController();
     _loginController.passwordController = TextEditingController();
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
        decoration: const BoxDecoration(
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
                      const Center(
                        child: Text(
                          "Inicio de Sesi??n",
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
                              controller: _loginController.emailController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Digite su correo",
                                labelText: "Correo",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String? value) => _loginController
                                  .validator(value, InputType.email),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            TextFormField(
                              controller: _loginController.passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: "Digite su contrase??a",
                                labelText: "Contrase??a",
                                border: const OutlineInputBorder(),
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
                              validator: (String? value) => _loginController
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
                          const Expanded(
                            child: InkWell(
                              onTap: null,
                              child: Text(
                                "??Olvidad?? su contrase??a?",
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
                              icon: const Icon(
                                Icons.login_rounded,
                                color: Colors.white,
                              ),
                              label: const Text(
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
                          const Text("??No tienes una cuenta?"),
                          InkWell(
                            onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            ),
                            child: const Text(
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
