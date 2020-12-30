import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: Get.theme.textTheme.headline4,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text("Continue with Google"),
                onPressed: () => _controller.loginWithGoogle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
