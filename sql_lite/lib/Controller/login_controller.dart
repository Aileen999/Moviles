import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sql_lite/models/enum_model.dart';
import 'package:sql_lite/models/user_model.dart';
import 'package:sql_lite/pages/home_pages.dart';


class LoginController {
  TextEditingController userController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();
  bool visiblePassword = true;
  String validator(value, InputType inputType) {
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

  void signIn(BuildContext context) {
    if (formKey.currentState.validate()) {
      bool valido = false;
      UserModel user;
      // userList.forEach((element) {
      //   if (element.user == userController.text &&
      //       element.password == passwordController.text) {
      //     valido = true;
      //    user = element;
      //   }
      // });
      if (valido == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
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
    }else{
      
    }
  }
}
