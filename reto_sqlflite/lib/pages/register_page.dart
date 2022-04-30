import 'package:flutter/material.dart';
import 'package:reto_sqlflite/controller/register_controller.dart';
import 'package:reto_sqlflite/model/enum_model.dart';
import 'package:reto_sqlflite/pages/login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _registerController = RegisterController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _registerController.nameController.dispose();
    _registerController.lastNameController.dispose();
    _registerController.emailController.dispose();
    _registerController.passwordController.dispose();
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
                          "Registrar usuario",
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
                        key: _registerController.formKey,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextFormField(
                              controller: _registerController.nameController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Digite su nombre",
                                labelText: "Nombre",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String? value) =>
                                  _registerController.validator(value, InputType.name),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            TextFormField(
                              controller:
                                  _registerController.lastNameController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Digite su apellido",
                                labelText: "Apellido",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String? value) =>
                                  _registerController.validator(value, InputType.lastName),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            TextFormField(
                              controller: _registerController.emailController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Digite su correo electrónico",
                                labelText: "Correo electrónico",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String? value) =>
                                  _registerController.validator(value, InputType.email),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            TextFormField(
                              controller:
                                  _registerController.passwordController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline_rounded),
                                hintText: "Digite su contraseña",
                                labelText: "Contraseña",
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: null,
                              validator: (String? value) =>
                                  _registerController.validator(value, InputType.password),
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
                          SizedBox(
                            width: w * 0.35,
                            height: h * 0.05,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              icon: const Icon(
                                Icons.backup_rounded,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Volver",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.35,
                            height: h * 0.05,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await _registerController.register(context);
                              },
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
