import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reto_sqlflite/pages/home_pages.dart';
import 'package:reto_sqlflite/services/database_service.dart';

import '../model/enum_model.dart';
import '../model/user_model.dart';

class RegisterController {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController lastNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  final formKey = GlobalKey<FormState>();
  bool visiblePassword = true;

  String? validator(value, InputType inputType) {
    if (inputType == InputType.name) {
      if (value.isEmpty || value == null) {
        return "El nombre es requerido";
      }
    } else if (inputType == InputType.lastName) {
      if (value.isEmpty || value == null) {
        return "El apellido es requerido";
      }
    } else if (inputType == InputType.email) {
      if (value.isEmpty || value == null) {
        return "El correo es requerido";
      }

      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
        return "Digite un correo válido";
      }
    } else {
      if (value.isEmpty || value == null) {
        return "La contraseña es requerida";
      }
      if (!RegExp(r"^.{6,}$").hasMatch(value)) {
        return "Debe de tener almenos 6 digitos";
      }
    }

    return null;
  }

  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      UserModel user = UserModel(
          null,
          emailController.value.text,
          lastNameController.value.text,
          passwordController.value.text,
          nameController.value.text,
          1);

      user.id = await DatabaseService.insert(user);

      if (user.id != 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        Fluttertoast.showToast(
          msg: "Usuario " + user.name + ", registrado con éxito",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 12.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error al registrar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0,
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Error al registrar, verifique que no hayan errores",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0,
        );
    }
  }
}
