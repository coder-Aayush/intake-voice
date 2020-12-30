import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intakeproject/controller/auth_controller.dart';
import 'package:intakeproject/screen/home.dart';
import 'package:intakeproject/screen/login.dart';

class AuthChecker extends StatelessWidget {
  final AuthController _controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: _controller.onAuthChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? Home() : LoginScreen();
      },
    );
  }
}
