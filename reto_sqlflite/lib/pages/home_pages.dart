import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido"),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            onPressed: () async {},
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: const Text(
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
          children: const [
            Text(
              "Perfil",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            
            ],
        ),
      ),
    );
  }
}
