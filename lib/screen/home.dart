import 'package:flutter/material.dart';
import 'package:intakeproject/controller/auth_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: Text('Logout'),
        onPressed: () => authController.logout(),
      ),
    );
  }
}
