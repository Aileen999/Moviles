import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            onPressed: () async {},
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: Text(
              "Salir",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Perfil",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),/*
            userProvider.type != null
                ? Text(
                    "Acceso mediante: " +
                        (userProvider.type ? 'Google' : 'Correo y contraseña'),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                : SizedBox(
                    height: 0,
                    width: 0,
                  ),
            SizedBox(
              height: 30,
            ),
            user.photoURL != null
                ? CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.photoURL),
                  )
                : Text('Este usuario no tiene foto'),
            SizedBox(
              height: 30,
            ),
            Text(
              "Nombre: " + (user.displayName ?? 'No presenta'),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Correo: " + (user.email ?? 'No presenta'),
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          */],
        ),
      ),
    );
  }
}
