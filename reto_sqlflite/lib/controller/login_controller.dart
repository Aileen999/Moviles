import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reto_sqlflite/services/database_service.dart';

import '../model/enum_model.dart';
import '../model/user_model.dart';
import '../pages/home_pages.dart';

class LoginController {
  TextEditingController userController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();
  bool visiblePassword = true;
  String? validator(value, InputType inputType) {
    if (inputType == InputType.user) {
      if (value.isEmpty || value == null) {
        return "El usuario es requerido";
      }
    } else {
      if (value.isEmpty || value == null) {
        return "La contraseña es requerida";
      }
    }

    return null;
  }

  void changeVisible() {
    visiblePassword = !visiblePassword;
  }

  Future<void> signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
  
      UserModel user = await DatabaseService.userGetByEmailPassword(
          userController.value.text, passwordController.value.text);

      if (user.id!=0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        Fluttertoast.showToast(
            msg: "Usuario " + user.name + ", accedió con éxito",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 12.0);
      } else {
        Fluttertoast.showToast(
            msg: "Usuario o contraseña incorrectos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    } else {}
  }
}
