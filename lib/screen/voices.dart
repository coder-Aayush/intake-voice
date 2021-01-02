import 'package:flutter/material.dart';
import 'package:intakeproject/controller/auth_controller.dart';
import 'package:intakeproject/controller/firebase.dart';

class Voices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$this"),
      ),
      body: ListView(
        children: [
          OutlineButton(
            onPressed: () => firebaseHalperController.getUserAudioFile(
              userid: authController.getUser().uid,
            ),
            child: Text('Hola'),
          ),
        ],
      ),
    );
  }
}
