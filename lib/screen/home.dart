import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/auth_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(authController.getUser().photoUrl),
          ),
        ),
        title: Text(authController.getUser().displayName),
      ),
      body: ListView(
        children: [
          _recordLayout(),
        ],
      ),
    );
  }

  Widget _recordLayout() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard_voice,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Record and Upload",
            style: Get.theme.textTheme.headline5.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
